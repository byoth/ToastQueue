//
//  ViewController.swift
//  ToastQueueExample
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import UIKit

import ToastQueue

import RxSwift
import RxCocoa


final class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    
    fileprivate let disposeBag: DisposeBag = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var count: Int = 0
        
        self.button.rx.tap
            .subscribe(onNext: {
                count += 1
                
                ToastManager.shared.showMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras pellentesque. \(count)")
            })
            .disposed(by: self.disposeBag)
    }
}

