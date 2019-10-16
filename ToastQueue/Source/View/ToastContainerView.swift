//
//  ToastContainerView.swift
//  ToastQueue
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import Foundation


final class ToastContainerView: BaseView {
    @IBOutlet weak var messageStackView: UIStackView!
    
    
    internal var messageModels: [ToastMessageModel] = [] {
        didSet {
            self.updateMessageStackView(messageModels: self.messageModels)
        }
    }
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(0)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    
    override func setup() {
        super.setup()
        
        self.isUserInteractionEnabled = false
        
        self.messageStackView.spacing = ToastManager.Setting.messagesSpacing
    }
    
    
    fileprivate func updateMessageStackView(messageModels: [ToastMessageModel]) {
        self.messageStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        messageModels.forEach {
            self.messageStackView.addArrangedSubview(self.createMessageView($0))
        }
    }
    
    
    private func createMessageView(_ messageModel: ToastMessageModel) -> ToastMessageView {
        let view: ToastMessageView = .init()
        
        view.messageModel = messageModel
        
        return view
    }
}
