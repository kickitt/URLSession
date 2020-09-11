//
//  User.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation

struct User: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case address
        case phone
        case webSite = "website"
        case company
    }
    
    let id: Int
    let name: String
    let email: String
    let address: Address
    let phone: String
    let webSite: String // это поле не совпадает с ключем в JSON
    let company: Company
}
