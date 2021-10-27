//
//  Property.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 24/10/21.
//

import Foundation

struct Property: Codable {
    var id: Int
    var projectName: String?
    var tenure: Int?
    var photo: String?
    var completedAt: String?
    var category: String?
    var address: Address?
    var attributes: Attributes?
}
struct Address: Codable {
    var district: String?
    var streetName: String?
}

struct Attributes: Codable {
    var areaSize: Int?
    var bathrooms: Int?
    var bedrooms: Int?
    var price: Int?
}
