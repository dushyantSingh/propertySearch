//
//  MockService.swift
//  PropertySearchTests
//
//  Created by Dushyant Singh on 27/10/21.
//

import Foundation
import RxSwift

@testable import PropertySearch

class MockService: PropertySearchType {
    let mockPropertyObservable = PublishSubject<[Property]>()
    func getDefaultProperties() -> Observable<[Property]> {
        return mockPropertyObservable.asObservable()
    }

    let mockDetailsObservable = PublishSubject<PropertyDetail?>()
    func getPropertyDetails(_ id: Int) -> Observable<PropertyDetail?> {
        return mockDetailsObservable.asObservable()
    }
}
