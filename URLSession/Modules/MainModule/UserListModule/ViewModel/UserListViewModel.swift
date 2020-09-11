//
//  ViewModel.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation
import UIKit

class UserListViewModel: UserListViewModelProtocol {
    
    var isFetching: Bool = false
    
    var onFetching: (() -> ())?
    var onFetchingComplition: (([User]?, String?) -> ())?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com"
    
    func startFetch() {
        //start loading
        isFetching = true
        onFetching?()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            
            let path = "users"
            guard let url = URL(string: "\(self.baseUrlString)/\(path)") else {
                self.isFetching = false
                self.onFetchingComplition?(nil, "Что то пошло не так!!!")
                return
            }
            let sessionConfiguration = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfiguration)
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                
                self.isFetching = false
                
                if let error = error {
                    DispatchQueue.main.async {
                        self.onFetchingComplition?([], error.localizedDescription)
                    }
                } else if let data = data {
                    do {
                        let users = try JSONDecoder().decode([User].self, from: data)
                        //Обновить DataSource таблицы
                        DispatchQueue.main.async {
                            self.onFetchingComplition?(users, nil)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            // выводи алерт с ошибкой в главном потоке
                            self.onFetchingComplition?(nil, error.localizedDescription)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        // выводи алерт с дефольтной ошибкой "типа что то пошло не так" в главном потоке
                        DispatchQueue.main.async {
                            self.onFetchingComplition?(nil, "что то пошло не так")
                        }
                    }
                }
            }
            
            dataTask.resume()
        }
    }
}
