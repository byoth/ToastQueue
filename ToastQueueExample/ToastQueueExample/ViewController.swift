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


final class ViewController: UIViewController {
    fileprivate let disposeBag: DisposeBag = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable<Int>
            .interval(1.0, scheduler: MainScheduler.instance)
            .subscribe(onNext: {
                ToastManager.shared.showMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras pellentesque. \($0)")
            })
            .disposed(by: self.disposeBag)
    }
}

