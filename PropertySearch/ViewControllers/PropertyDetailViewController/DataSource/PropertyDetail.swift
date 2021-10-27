//
//  PropertyDetail.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 27/10/21.
//

import Foundation

struct PropertyDetail: Codable {
    let id: Int
    let photo: String?
    let projectName: String?
    let address: AddressDetail?
    let attributes: AttributesDetails?
    let details: [Detail]?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case id
        case photo
        case projectName = "project_name"
        case attributes
        case address
        case details = "property_details"
        case description
    }
}

struct Detail: Codable {
    let label: String
    let text: String
}

struct AddressDetail: Codable {
    let mapCoordinates: MapCoordinates?
    let subtitle: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case mapCoordinates = "map_coordinates"
        case subtitle
        case title
    }
}

struct AttributesDetails: Codable {
    var areaSize: Int?
    var bathrooms: Int?
    var bedrooms: Int?
    var price: Int?

    enum CodingKeys: String, CodingKey {
        case areaSize = "area_size"
        case bathrooms
        case bedrooms
        case price
    }
}

struct MapCoordinates: Codable {
    let lat: Double?
    let lng: Double?
}
