//
//  MainView.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    lazy var scrollView = makeScrollView()
    lazy var activityIndicator = makeActivityIndicator()
    lazy var fetchButton = makeFetchButton()
    lazy var postButton = makePostButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        updateLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLayout() {
        scrollView.updateConstraints()
        activityIndicator.updateConstraints()
        fetchButton.updateConstraints()
        postButton.updateConstraints()
    }
}
