//
//  ViewController.swift
//  ToastQueueExample
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import UIKit

import ToastQueue


final class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    fileprivate var count: Int = 0
    
    
    @IBAction func buttonDidTap(_ sender: Any) {
        self.count += 1
        
        ToastManager.shared.showMessage("\(self.textField.text ?? "")\(self.count)")
        
        self.view.endEditing(true)
    }
}
