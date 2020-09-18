//
//  UserPostsCell.swift
//  URLSession
//
//  Created by Roman Berezin on 17.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class UserPostCell: UITableViewCell {
    let postLable = UILabel()
    let postBody = UILabel()
    var model: PostModel? {
        didSet {
            postLable.text = model?.title ?? "None"
            postBody.text = model?.body ?? "None"
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
        
        postLable.numberOfLines = 0
        postBody.numberOfLines = 0
        postBody.font = UIFont.systemFont(ofSize: 14)
        
        self.addSubview(postLable)
        self.addSubview(postBody)
        
        postLable.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(10)
            maker.left.equalToSuperview().offset(10)
            maker.right.lessThanOrEqualToSuperview().offset(10)
        }
        
        postBody.snp.makeConstraints { maker in
            maker.top.equalTo(postLable.snp.bottom).offset(10)
            maker.left.equalToSuperview().offset(10)
            maker.right.lessThanOrEqualToSuperview().offset(10)
            maker.bottom.lessThanOrEqualToSuperview().inset(10)
        }
    }
}
