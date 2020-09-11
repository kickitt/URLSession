//
//  CheckInternetController.swift
//  URLSession
//
//  Created by Yurii Bosov on 11.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit
import MBProgressHUD

class CheckInternetVC: BaseViewController, CheckInternetView {
    
    @IBOutlet private var statusLabel: UILabel?
    @IBOutlet private var checkButton: UIButton?
    
    var onCheckInternetSuccess: (()->())?
    
    var viewModel: CheckInternetViewModelAbstract? {
        didSet {
            viewModel?.onChecking = { [weak self] in
                self?.internetChecking()
            }
            viewModel?.onCheckComplition = { [weak self] isConnected in
                self?.internetCheckComplition(isConnected)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusLabel?.text = "проверка соединения..."
        checkButton?.isHidden = true
        viewModel?.checkInternet()
    }
    
    private func internetChecking() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    private func internetCheckComplition(_ isConnected: Bool) {
        if isConnected {
            let hud = MBProgressHUD.forView(view)
            hud?.mode = .text
            hud?.label.text = "Connected"
            hud?.show(animated: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                hud?.hide(animated: true)
                self.onCheckInternetSuccess?()
            }
            
        }  else {
            MBProgressHUD.hide(for: view, animated: true)
            checkButton?.isHidden = false
        }
    }
    
    @IBAction private func checkButtonTapped() {
        viewModel?.checkInternet()
    }
}
