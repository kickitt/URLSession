//
//  MainButton.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class MainButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setParams()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setParams()
    }
    
    private func setParams() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 11.3
        self.backgroundColor = UIColor(red: 24/255, green: 105/255, blue: 132/255, alpha: 1)

    }
}

