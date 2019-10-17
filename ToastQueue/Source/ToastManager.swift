//
//  ToastManager.swift
//  ToastQueue
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import Foundation

import SnapKit
import Then


public final class ToastManager: NSObject {
    public static let shared: ToastManager = .init()
    
    public struct Setting {
        public static var maxMessagesCount: Int = 5
        public static var messagesSpacing: CGFloat = 8
        
        public static var backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.8)
        public static var textColor: UIColor = .white
        
        public static var duration: TimeInterval = 2.0
        public static var animationDuration: TimeInterval = 0.8
    }
    
    public weak var window: UIWindow?
    
    private var containerView: ToastContainerView?
    
    
    private override init() {
        super.init()
    }
    
    
    public func showMessage(_ message: String) {
        let model: ToastMessageModel = .init(message: message)
        
        self.updateContainerView()
        
        self.containerView?.appendMessageView(model)
    }
    
    
    private func updateContainerView() {
        guard let viewController = self.window?.getHighestViewController() else {
            return
        }
        
        if self.containerView == nil {
            let view: ToastContainerView = .init()
            
            self.containerView = view
            
            viewController.view.addSubview(view)
        }
    }
}
