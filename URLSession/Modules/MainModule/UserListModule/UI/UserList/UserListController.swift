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
        bindingModel()
        tableView.tableView.refreshControl?.addTarget(self, action: #selector(update), for: UIControl.Event.valueChanged)
        update()
    }
    
    private func bindingModel() {
        viewModel.onFetching = {
            //loading process
//            ProgressHUD.show()
        }
        
        viewModel.onFetchingComplition = { [weak self] users, error in
            //stop loading process
            self?.tableView.tableView.refreshControl?.endRefreshing()
            
            if let users = users {
//                ProgressHUD.dismiss()
                self?.tableView.dataSource = users
            }
            if let error = error {
//                ProgressHUD.showError(error, interaction: false)
            }
        }
    }
    
    @objc func update() {
        if !viewModel.isFetching {
            viewModel.startFetch()
        }
    }
}
