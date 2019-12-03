//
//  Shop.swift
//  Shops
//
//  Created by Tommy Troest on 02/12/2019.
//  Copyright © 2019 Tommy Troest. All rights reserved.
//

import Foundation

struct Shop: Codable {
    var name: String
    var company: String
    var category: String
    var id: Int
    var address: Address
    var contact: Contact
}
