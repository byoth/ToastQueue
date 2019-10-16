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
    }
    
    public weak var window: UIWindow?
    
    private var toastContainerView: ToastContainerView?
    
    private var _messages: [ToastMessageModel] = [] {
        didSet {
            self.renderMessages()
        }
    }
    
    
    private override init() {
        super.init()
    }
    
    
    public func showMessage(_ message: String) {
        self._messages.append(.init(message: message))
        
        if self._messages.count > Setting.maxMessagesCount {
            self.hideOldestMessage()
        }
    }
    
    public func hideOldestMessage() {
        self._messages.remove(at: 0)
    }
    
    
    private func renderMessages() {
        guard let viewController = self.window?.getHighestViewController() else {
            return
        }
        
        if self.toastContainerView == nil {
            let view: ToastContainerView = .init()
            
            self.toastContainerView = view
            
            viewController.view.addSubview(view)
        }
        
        self.toastContainerView?.messageModels = self._messages
    }
}
