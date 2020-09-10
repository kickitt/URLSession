//
//  ViewModel.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation

final class UserListViewModel: UserListViewModelProtocol {
   
    let baseUrlString = "http://jsonplaceholder.typicode.com"
    
    func startFetch() -> [User] {
        //start loading
        var usersArray: [User] = []
        let path = "users"
        guard let urll = URL(string: "\(baseUrlString)/\(path)") else { return []}
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        let dataTask = session.dataTask(with: urll) { (data, response, error) in
            if let error = error {
                print("error \(error)")
            } else if let data = data {
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    usersArray = users
                    print(usersArray)
                    
                    DispatchQueue.main.async {
                        // обновить dataSourсe у таблицы
                        // сделать reloadData у таблицы
                        
                    }
                    
                } catch {
                    print(error)
                    
                    DispatchQueue.main.async {
                        // выводи алерт с ошибкой в главном потоке
                      //  error.localizedDescription
                    }
                }
            } else {
                DispatchQueue.main.async {
                    // выводи алерт с дефольтной ошибкой "типа что то пошло не так" в главном потоке
                }
            }
        }
        dataTask.resume()
        
        return usersArray
    }
}
