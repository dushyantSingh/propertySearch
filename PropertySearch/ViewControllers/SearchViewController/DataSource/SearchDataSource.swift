//
//  SearchDataSource.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 24/10/21.
//

import Foundation
import RxSwift
import RxDataSources

struct SearchDataSource {
    var header: String
    var items: [Item]
}

extension SearchDataSource: SectionModelType {
    typealias Item  = Property
    init(original: SearchDataSource, items: [Item]) {
       self = original
        self.items = items
    }
}
