//
//  CheckInternetView.swift
//  URLSession
//
//  Created by Yurii Bosov on 11.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation

protocol CheckInternetView {
    var viewModel: CheckInternetViewModelAbstract? { get set }
    
    var onCheckInternetSuccess: (()->())? { get set}
}
