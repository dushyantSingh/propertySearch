//
//  PropertySearchType.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 24/10/21.
//

import RxSwift

protocol PropertySearchType {
    func getDefaultProperties() -> Observable<[Property]>
    func getPropertyDetails(_ id: Int) -> Observable<PropertyDetail?>
}
