//
//  NSObject.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: self)
    }
    
    static var className: String {
        return String(describing: self)
    }
}
