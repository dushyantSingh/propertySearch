//
//  PropertyFactory.swift
//  PropertySearchTests
//
//  Created by Dushyant Singh on 27/10/21.
//

import Foundation

@testable import PropertySearch
struct PropertyFactory {
    static let property_1 = Property(id: 0,
                                     projectName: "Test Name",
                                     tenure: 99,
                                     photo: nil,
                                     completedAt: "2001",
                                     category: "Condo",
                                     address: Address(district: "Gotham", streetName: "1 Dark Alley"),
                                     attributes: Attributes(areaSize: 2000,
                                                            bathrooms: 2,
                                                            bedrooms: 2,
                                                            price: 30000))
    static let propertyDetail_1 = PropertyDetail(id: 0,
                                                 photo: nil,
                                                 projectName: "Test name",
                                                 address: AddressDetail(mapCoordinates: MapCoordinates(lat: 0.0,
                                                                                                       lng: 0.0),
                                                                        subtitle: "Something here",
                                                                        title: "Something there"),
                                                 attributes: AttributesDetails(areaSize: 2000,
                                                                               bathrooms: 2,
                                                                               bedrooms: 2,
                                                                               price: 2020)
                                                 , details: [Detail(label: "Some Label",
                                                                    text: "Some Text")],
                                                 description: "Some description")
}
