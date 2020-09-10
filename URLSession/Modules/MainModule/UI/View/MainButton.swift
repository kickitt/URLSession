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
        setupButton()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        //self.layer.borderWidth = 1
        self.layer.cornerRadius = 11.3
        self.backgroundColor = UIColor(red: 24/255, green: 105/255, blue: 132/255, alpha: 1)

    }
    
    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = self.backgroundColor?.withAlphaComponent(isHighlighted ? 0.5 : 1)
            self.setTitleColor(titleColor(for: .normal)?.withAlphaComponent(isHighlighted ? 0.7 : 1),
                               for: .normal)
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = self.backgroundColor?.withAlphaComponent(isEnabled ? 1 : 0.3)
            self.setTitleColor(titleColor(for: .normal)?.withAlphaComponent(isEnabled ? 1 : 0.6),
                               for: .normal)
        }
    }
}

