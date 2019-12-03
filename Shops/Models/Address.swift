//
//  Address.swift
//  Shops
//
//  Created by Tommy Troest on 30/11/2019.
//  Copyright © 2019 Tommy Troest. All rights reserved.
//

import Foundation

struct Address: Codable {
    var street: String
    var streetNumber: String
    var postalCode: Int
    var city, country: String

    enum CodingKeys: String, CodingKey {
        case street
        case streetNumber = "street-number"
        case postalCode = "postal-code"
        case city, country
    }
    
    func addressAsString() -> String {
        return "\(street) \(streetNumber), \(String(postalCode)) \(city), \(country)"
    }
}
