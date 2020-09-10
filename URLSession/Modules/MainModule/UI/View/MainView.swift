//
//  MainView.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var onFetchPressed: (()->())?
    var onPostPressed: (()->())?

    lazy var scrollView = makeScrollView()
    lazy var activityIndicator = makeActivityIndicator()
    lazy var fetchButton = makeFetchButton()
    lazy var postButton = makePostButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateLayout()
        fetchButton.addTarget(self, action: #selector(fetchButtonPressed), for: .touchUpInside)
        postButton.addTarget(self, action: #selector(postButtonPressed), for: .touchUpInside)
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
    
    //MARK: - Button's Actions
    
    @objc func fetchButtonPressed() {
        print("GET")
        onFetchPressed?()
    }
    
    @objc func postButtonPressed() {
        print("POST")
        onPostPressed?()
    }
}
