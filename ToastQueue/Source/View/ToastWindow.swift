//
//  ToastWindow.swift
//  ToastQueue
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import Foundation


final class ToastWindow: UIWindow {
    static let shared: ToastWindow = .init(frame: UIScreen.main.bounds)
    
    private let _viewController: UIViewController = .init()
    private let _containerView: ToastContainerView = .init()
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        self.rootViewController = self._viewController
        self.windowLevel = ToastManager.Setting.Window.level
        self.isUserInteractionEnabled = false
        
        self.setupViewController()
        
        self.makeKeyAndVisible()
    }
    
    private func setupViewController() {
        self._viewController.view.do {
            $0.backgroundColor = .clear
            
            $0.addSubview(self._containerView)
        }
    }
    
    
    func showMessage(_ model: ToastMessageModel) {
        self._containerView.appendMessageView(model)
    }
}
