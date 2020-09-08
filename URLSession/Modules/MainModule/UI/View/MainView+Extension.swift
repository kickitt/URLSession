//
//  MainView+Extension.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit
import SnapKit

extension MainView {
    
    func makeScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        addSubview(scrollView)
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .green
        scrollView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
            maker.centerX.equalToSuperview()
        }
        return scrollView
    }
    
    func makeActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        scrollView.addSubview(activityIndicator)
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        activityIndicator.snp.makeConstraints { maker in
            maker.top.equalTo(scrollView.snp.top).inset(150)
            maker.centerX.equalTo(scrollView.snp.centerX)
        }
        return activityIndicator
    }
    
    func makeFetchButton() -> UIButton {
        let fetchButton = MainButton()
        scrollView.addSubview(fetchButton)
        fetchButton.setTitle("Get Users", for: .normal)
        fetchButton.snp.makeConstraints { maker in
            maker.top.equalTo(activityIndicator.snp.top).inset(200)
            maker.left.equalTo(self.snp.left).inset(60)
            maker.bottom.greaterThanOrEqualTo(scrollView.snp.bottom).inset(200)
        }
        return fetchButton
    }
    
    func makePostButton() -> UIButton {
        let postButton = MainButton()
        scrollView.addSubview(postButton)
        postButton.setTitle("POST Test", for: .normal)
        postButton.snp.makeConstraints { maker in
            maker.top.equalTo(activityIndicator.snp.top).inset(200)
            maker.left.greaterThanOrEqualTo(fetchButton.snp.right).offset(20).priority(.low)
            maker.right.equalTo(self.snp.right).inset(60)
            maker.bottom.greaterThanOrEqualTo(scrollView.snp.bottom).inset(200)
        }
        return postButton
    }
    
    
}
