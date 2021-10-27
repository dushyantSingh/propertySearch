//
//  MainViewModelCoordinator.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 24/10/21.
//

import Foundation
import RxSwift

class MainViewModelCoordinator {
    let navigationAction = PublishSubject<NavigationAction>()
    let viewModel = SearchViewModel()
    private let disposeBag = DisposeBag()
}

extension MainViewModelCoordinator {
    func createStartUpViewModel() -> SearchViewModel {
        viewModel.showPropertyDetails
            .observe(on: MainScheduler.instance)
            .flatMap { details -> Observable<NavigationAction> in
                let detailViewModel = PropertyDetailViewModel(detail: details)
                return .just(.push(viewModel: detailViewModel, animated: true))
            }
            .bind(to: navigationAction)
            .disposed(by: disposeBag)

        return viewModel
    }
}
