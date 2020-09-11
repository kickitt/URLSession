//
//  CheckInternetViewModelAbstract.swift
//  URLSession
//
//  Created by Yurii Bosov on 11.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation

protocol CheckInternetViewModelAbstract {
    
    var onChecking: (()->())? { get set }
    var onCheckComplition: ((Bool)->())? { get set }
    
    func checkInternet()
}
