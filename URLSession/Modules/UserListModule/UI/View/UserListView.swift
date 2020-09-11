//
//  UserListView.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class UserListView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    var dataSource: [User] = [] {
        didSet {
           tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        if let cell = cell as? UserCell {
            cell.model = model
        }
        return cell
    }
    
    //MARK: - TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
