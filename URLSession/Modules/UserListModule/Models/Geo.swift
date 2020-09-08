//
//  Geo.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation

struct Geo: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    
    let lat: Double //тип этого поле не совпадает с типом в JSON
    let lng: Double //тип этого поле не совпадает с типом в JSON
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let latStringValue = try container.decode(String.self, forKey: .lat)
        lat = Double(latStringValue) ?? 0
        
        let lngStringValue = try container.decode(String.self, forKey: .lng)
        lng = Double(lngStringValue) ?? 0
    }
}
