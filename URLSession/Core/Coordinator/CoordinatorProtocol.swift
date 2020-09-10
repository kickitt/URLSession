//
//  CoordinatorProtocol.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {
    var window: UIWindow { get set }
    func startFlow()
}
