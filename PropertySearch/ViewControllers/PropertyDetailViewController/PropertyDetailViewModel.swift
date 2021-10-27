//
//  PropertyDetailViewModel.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 27/10/21.
//

import Foundation
import RxSwift
import RxCocoa

class PropertyDetailViewModel {
    let propertyDetail: PropertyDetail
    let propertyDataSource = BehaviorRelay<[DetailDatasource]>(value: [])

    init(detail: PropertyDetail) {
        self.propertyDetail = detail
        setupDataSource()
    }
}
private extension PropertyDetailViewModel {
    func setupDataSource() {
        var items = [DetailCellType]()

        items.append(contentsOf: getImageCells())
        items.append(contentsOf: getPriceCells())
        items.append(contentsOf: getPropertyNameCells())
        items.append(contentsOf: getPropertyAddressCells())
        items.append(contentsOf: getRoomDetailsCells())
        items.append(contentsOf: getPropertyDetailsCells())
        items.append(contentsOf: getPropertyDescriptionCells())
        propertyDataSource.accept([DetailDatasource(header: "",
                                                    items: items)])
    }

    func getImageCells() -> [DetailCellType] {
        if let urlstring = propertyDetail.photo,
           let url = URL(string: urlstring) {
            let imageType = DetailCellType.propertyImage(url)
            return [imageType,
                    .height(15)]
        }
        return []
    }

    func getPriceCells() -> [DetailCellType] {
        if let price = propertyDetail.attributes?.price {
            let labelString = "$\(price)"
            let item = DetailCellType.label(text: labelString,
                                            font: UIFont.boldSystemFont(ofSize: 24),
                                            textColor: .darkText)
            return [item,
                    .height(15)]
        }
        return []
    }

    func getPropertyDetailsItems(_ details: [Detail]) -> [DetailCellType] {
        var items = [DetailCellType]()
        details.forEach { detail in
            items.append(.height(10))
            items.append(DetailCellType.titleLabel(title: detail.label,
                                                   text: detail.text))
        }
        return items
    }

    func getPropertyNameCells() -> [DetailCellType] {
        if let name = propertyDetail.projectName {
            let item = DetailCellType.label(text: name,
                                            font: UIFont.boldSystemFont(ofSize: 18),
                                            textColor: .darkText)
            return [item,
                    .height(10)]
        }
        return []
    }

    func getPropertyAddressCells() -> [DetailCellType] {
        var items = [DetailCellType]()
        if let address = propertyDetail.address {
            if let title = address.title {
                let item = DetailCellType.label(text: title,
                                                font: UIFont.systemFont(ofSize: 14),
                                                textColor: .gray)
                items.append(item)
                items.append(DetailCellType.height(2))
            }
            if let subtitle = address.subtitle {
                let item = DetailCellType.label(text: subtitle,
                                                font: UIFont.systemFont(ofSize: 14),
                                                textColor: .gray)
                items.append(item)
            }
            if items.count > 0 {
                items.append(DetailCellType.height(20))
            }
        }
        return items
    }

    func getRoomDetailsCells() -> [DetailCellType] {
        if let attributes = propertyDetail.attributes {
            let item = DetailCellType.label(text: getRoomsString(attributes),
                                            font: UIFont.systemFont(ofSize: 16),
                                            textColor: .gray)
           return [item]
        }
        return []
    }

    func getPropertyDetailsCells() -> [DetailCellType] {
        var items = [DetailCellType]()
        if let details = propertyDetail.details {
            items.append(DetailCellType.height(25))
            items.append(.separator)

            items.append(DetailCellType.height(25))
            let titleItem = DetailCellType.label(text: "Property details",
                                                 font: UIFont.boldSystemFont(ofSize: 18),
                                                 textColor: .darkText)
            items.append(titleItem)
            items.append(DetailCellType.height(15))
            items.append(contentsOf: getPropertyDetailsItems(details))
            items.append(DetailCellType.height(25))
        }
        return items
    }

    func getPropertyDescriptionCells() -> [DetailCellType] {
        var items = [DetailCellType]()
        if let description = propertyDetail.description {
            items.append(.separator)
            items.append(DetailCellType.height(25))
            let descriptionItem = DetailCellType.label(text: "Description",
                                                 font: UIFont.boldSystemFont(ofSize: 18),
                                                 textColor: .darkText)
            items.append(descriptionItem)
            items.append(DetailCellType.height(20))
            let item = DetailCellType.label(text: description,
                                            font: UIFont.systemFont(ofSize: 16),
                                            textColor: .gray)
            items.append(item)
        }
        return items
    }
}

private extension PropertyDetailViewModel {
    func getRoomsString(_ attributes: AttributesDetails) -> String {
        var roomsString = ""

        if let bedRooms = attributes.bedrooms {
            roomsString = roomsString + "\(bedRooms) Beds"
        }

        if let bathrooms = attributes.bathrooms {
            roomsString = roomsString.count > 0 ? roomsString + " . " : roomsString
            roomsString = roomsString + "\(bathrooms) Baths"
        }

        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        if let area = attributes.areaSize,
           let size = nf.string(from: NSNumber(value: area)) {
            roomsString = roomsString.count > 0 ? roomsString + " . " : roomsString
            roomsString = roomsString + size + " sqft"
        }
        return roomsString
    }
}
