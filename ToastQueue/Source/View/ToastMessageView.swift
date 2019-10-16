//
//  ToastMessageView.swift
//  ToastQueue
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import Foundation


final class ToastMessageView: BaseView {
    @IBOutlet weak var messageLabel: UILabel!
    
    
    internal var messageModel: ToastMessageModel? {
        didSet {
            self.updateMessageLabel(text: self.messageModel?.message)
        }
    }
    
    
    override func setup() {
        super.setup()
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.clipsToBounds = true
        self.layer.cornerRadius = 16
        
        self.messageLabel.do {
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 15)
            $0.lineBreakMode = .byCharWrapping
            $0.numberOfLines = 0
        }
    }
    
    
    fileprivate func updateMessageLabel(text: String?) {
        self.messageLabel.text = text
    }
}
