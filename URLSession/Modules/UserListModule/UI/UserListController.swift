//
//  File.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class UserListController: BaseViewController {
    
    var viewModel: UserListViewModelProtocol
    private let tableView = UserListView()
    
    init(viewModel: UserListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "Users"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = tableView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.startFetch()
        updateView()
    }
    
    
    private func updateView() {
        viewModel.onFetching = { [weak self] in
            //loading process
            self?.tableView.dataSource = []
        }
        
        viewModel.onFetchingComplition = { [weak self] users, error in
            //stop loading process
            
            if let users = users {
                self?.tableView.dataSource = users
            }
            
            if let error = error {
                self?.tableView.dataSource = []
                print(error)
            }
        }
    }
}
