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
            public static var backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.7)
            public static var textColor: UIColor = .white
            public static var font: UIFont = .systemFont(ofSize: 15)
        }
        
        public struct Duration {
            public static var show: TimeInterval = 2.0
            public static var animation: TimeInterval = 0.8
        }
    }
    
    private let _window: ToastWindow = .shared
    
    
    private override init() {
        super.init()
    }
    
    
    public func showMessage(_ message: String) {
        let model: ToastMessageModel = .init(message: message)
        
        self._window.do {
            $0.isOpaque = false
            $0.backgroundColor = .clear
            
            $0.showMessage(model)
        }
    }
}
