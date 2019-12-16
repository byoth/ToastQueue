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
    
    
    private var _toastCount: Int = 0
    
    
    var currentToastMessage: String {
        return "\(self.textField.text ?? "")\(self._toastCount)"
    }
    
    
    @IBAction func toastButtonDidTap(_ sender: Any) {
        self.showToastToTest()
        
        self.view.endEditing(true)
    }
    
    @IBAction func sceneButtonDidTap(_ sender: Any) {
        self.presentScene()
    }
    
    
    fileprivate func showToastToTest() {
        self._toastCount += 1
        
        ToastManager.shared.showMessage(self.currentToastMessage)
    }
    
    fileprivate func presentScene() {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController else {
            return
        }
        
        self.present(viewController, animated: true)
    }
}
