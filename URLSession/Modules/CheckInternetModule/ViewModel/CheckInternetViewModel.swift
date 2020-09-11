//
//  CheckInternetViewModel.swift
//  URLSession
//
//  Created by Yurii Bosov on 11.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation

class CheckInternetViewModel: CheckInternetViewModelAbstract {
    
    var onChecking: (() -> ())?
    var onCheckComplition: ((Bool) -> ())?
    
    func checkInternet() {
        onChecking?()
        //TODO: проверить наличие интернета
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.onCheckComplition?(true)
        }
    }
}
