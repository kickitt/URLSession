//
//  UserListViewModelProtocol.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation
import UIKit

protocol UserListViewModelProtocol {
    
    var isFetching: Bool { get set }
    var onFetching: (()->())? { get set }
    var onFetchingComplition: (([User]?, String? )->())? { get set }
    
    func startFetch()
}
