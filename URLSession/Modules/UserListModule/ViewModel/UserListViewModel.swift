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
    
    var onFetching: (() -> ())?
    var onFetchingComplition: (([User]?, String?) -> ())?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com"
    
    func startFetch() {
        //start loading
        let path = "users"
        guard let urll = URL(string: "\(baseUrlString)/\(path)") else { return }
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        let dataTask = session.dataTask(with: urll) { (data, response, error) in
            if let error = error {
                print("error \(error)")
            } else if let data = data {
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    //Обновить DataSource таблицы
                    DispatchQueue.main.async {
                        self.onFetchingComplition?(users, nil)
                    }

                } catch {
                    print(error)

                    DispatchQueue.main.async {
                        // выводи алерт с ошибкой в главном потоке
                        self.onFetchingComplition?(nil, error.localizedDescription)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    // выводи алерт с дефольтной ошибкой "типа что то пошло не так" в главном потоке

                }
            }
        }
        dataTask.resume()
    }
}
