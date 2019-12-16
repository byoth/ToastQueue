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
        public struct Messages {
            public static var maxCount: Int = 3
            public static var spacing: CGFloat = 8
        }
        
        public struct Message {
            public static var textColor: UIColor = .white
            public static var font: UIFont = .systemFont(ofSize: 15)
        }
        
        public struct Duration {
            public static var show: TimeInterval = 2.0
            public static var animation: TimeInterval = 0.5
        }
    }
    
    
    private var _topMostController: UIViewController?
    
    private var _containerView: ToastContainerView = .init()
    
    
    private override init() {
        super.init()
    }
    
    
    public func showMessage(_ message: String) {
        self.updateWindowIfNeeded()
        
        let model: ToastMessageModel = .init(message: message)
        
        self._containerView.appendMessageView(model)
    }
    
    
    private func updateWindowIfNeeded() {
        let window: UIWindow? = UIApplication.shared.keyWindow
        let topMostController: UIViewController? = window?.topMostController()
        
        guard self._topMostController != topMostController else {
            return
        }
        
        self._topMostController = topMostController
        
        self._containerView.removeFromSuperview()
        
        window?.addSubview(self._containerView)
    }
}
