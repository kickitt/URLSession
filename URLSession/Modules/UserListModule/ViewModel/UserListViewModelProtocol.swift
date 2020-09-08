//
//  UserListViewModelProtocol.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation

protocol UserListViewModelProtocol {
    var updateViewData: ((ViewData)->())? { get set }
    func startFetch()
    
}
