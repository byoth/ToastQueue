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
    
    
    struct Const {
        static let animationDamping: CGFloat = 0.7
        static let animationVelocity: CGFloat = 0.7
    }
    
    
    internal var model: ToastMessageModel? {
        didSet {
            self.updateMessageLabel(text: self.model?.message)
        }
    }
    
    private var _isDeactived: Bool = false
    
    
    override func setup() {
        super.setup()
        
        self.backgroundColor = ToastManager.Setting.backgroundColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 16
        
        self.messageLabel.do {
            $0.textColor = ToastManager.Setting.textColor
            $0.font = .systemFont(ofSize: 15)
            $0.lineBreakMode = .byCharWrapping
            $0.numberOfLines = 0
        }
        
        self.animateToAppear()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + ToastManager.Setting.duration) {
            self.animateToDisappear()
        }
    }
    
    
    func hide() {
        self.animateToDisappear()
    }
    
    
    private func animateToAppear() {
        self.alpha = 0
        self.transform = .init(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: ToastManager.Setting.animationDuration, delay: 0, usingSpringWithDamping: Const.animationDamping, initialSpringVelocity: Const.animationVelocity, options: .curveEaseInOut, animations: {
            self.alpha = 1
            self.transform = .init(scaleX: 1, y: 1)
        })
    }
    
    private func animateToDisappear() {
        guard !self._isDeactived else {
            return
        }
        
        self._isDeactived = true
        
        UIView.animate(withDuration: ToastManager.Setting.animationDuration, delay: 0, usingSpringWithDamping: Const.animationDamping, initialSpringVelocity: Const.animationVelocity, options: .curveEaseInOut, animations: {
            self.alpha = 0
            self.transform = .init(scaleX: 0.5, y: 0.5)
            
        }, completion: { [weak self] _ in
            if self?.superview != nil {
                self?.removeFromSuperview()
            }
        })
    }
    
    
    fileprivate func updateMessageLabel(text: String?) {
        self.messageLabel.text = text
    }
}
