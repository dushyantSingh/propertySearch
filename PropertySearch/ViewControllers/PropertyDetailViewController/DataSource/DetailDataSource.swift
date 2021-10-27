//
//  DetailDatasource.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 27/10/21.
//

import Foundation
import RxSwift
import RxDataSources

struct DetailDatasource {
    var header: String
    var items: [Item]
}

extension DetailDatasource: SectionModelType {
    typealias Item  = DetailCellType
    init(original: DetailDatasource, items: [Item]) {
       self = original
        self.items = items
    }
}
