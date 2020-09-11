//
//  DataManager.swift
//  URLSession
//
//  Created by Roman Berezin on 11.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation

class DataManager: UserListViewModelProtocol {
    
    var descr: String = "DataManager"
        
    var onFetching: (() -> ())?
    
    var onFetchingComplition: (([User]?, String?) -> ())?
    
    func startFetch() {
        
        let data = [User(id: 1, name: "lashkdbfalsk", email: "asdfsdfsd", address: Address(street: "ssjhflskj", suite: "fds.khglsdkn", city: "asfhsldkfj", zipcode: "dsfsdf", geo: nil), phone: "sadfgbskdfhb", webSite: "sf/lghsldkjfh", company: Company(name: "slfklsk", catchPhrase: "sdfkghsdlkjh", bs: "skdfjghlsdkjf"))]
        
        self.onFetchingComplition?(data, nil)
        
        print("Started fetch")
    }
}
