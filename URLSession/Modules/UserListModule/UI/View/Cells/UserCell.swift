//
//  UserCell.swift
//  URLSession
//
//  Created by Roman Berezin on 10.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    let userNameLabel = UILabel()
    let userCityLabel = UILabel()
    var model: User? {
        didSet {
            
            userNameLabel.text = model?.name ?? "None"
            userCityLabel.text = model?.address.city ?? "None"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        
        userNameLabel.numberOfLines = 0
        userCityLabel.numberOfLines = 0
        
        self.addSubview(userNameLabel)
        self.addSubview(userCityLabel)
        
        userNameLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(10).labeled("NAME LABEL TOP")
            maker.left.equalToSuperview().offset(10).labeled("NAME LABEL LEFT")
            maker.right.lessThanOrEqualToSuperview().offset(10).labeled("NAME LABEL RIGHT")
        }
        
        userCityLabel.snp.makeConstraints { maker in
            maker.top.equalTo(userNameLabel.snp.bottom).offset(10)
            maker.left.equalToSuperview().offset(10).labeled("NAME LABEL LEFT")
            maker.right.lessThanOrEqualToSuperview().offset(10).labeled("NAME LABEL RIGHT")
            maker.bottom.lessThanOrEqualToSuperview().inset(10).labeled("COMMENT LABEL BOTTOM")
        }
        
    }

}
