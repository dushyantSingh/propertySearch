//
//  SearchViewModel.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 24/10/21.
//

import Foundation
import RxCocoa
import RxSwift

class SearchViewModel {
    let searchService: PropertySearchType
    let properties = BehaviorRelay<[Property]>(value: [Property]())
    let propertySelected = PublishSubject<Property>()
    let showPropertyDetails = PublishSubject<PropertyDetail>()
    let disposeBag = DisposeBag()

    init(searchService: PropertySearchType = PropertySearchService()) {
        self.searchService = searchService
        fetchProperties()
        setupSelection()
    }
}
private extension SearchViewModel {
    func fetchProperties() {
        searchService
            .getDefaultProperties()
            .asObservable()
            .bind(to: properties)
            .disposed(by: disposeBag)
    }

    func setupSelection() {
        propertySelected.asObservable()
            .flatMap { property in
                self.searchService.getPropertyDetails(property.id)
            }
            .unwrap()
            .bind(to: showPropertyDetails)
            .disposed(by: disposeBag)
    }
}

extension Observable {
    func unwrap<T>() -> Observable<T> where Element == T? {
        self.filter { $0 != nil }.map { $0! }
    }
}
