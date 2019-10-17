//
//  ToastMessageView.swift
//  ToastQueue
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import Foundation


final class ToastMessageView: BaseView {
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    struct Constant {
        struct Animation {
            static let damping: CGFloat = 0.7
            static let velocity: CGFloat = 0.7
        }
    }
    
    
    internal var model: ToastMessageModel? {
        didSet {
            self.updateMessageLabel(text: self.model?.message)
        }
    }
    
    private var _isDeactived: Bool = false
    
    
    override func setup() {
        super.setup()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 16
        
        self.messageLabel.do {
            $0.textAlignment = .center
            $0.textColor = ToastManager.Setting.Message.textColor
            $0.font = ToastManager.Setting.Message.font
            $0.lineBreakMode = .byWordWrapping
            $0.numberOfLines = 0
        }
        
        self.animateToAppear()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + ToastManager.Setting.Duration.show) {
            self.animateToDisappear()
        }
    }
    
    
    func hide() {
        self.animateToDisappear()
    }
    
    
    private func animateToAppear() {
        self.alpha = 0
        self.transform = .init(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: ToastManager.Setting.Duration.animation, delay: 0, usingSpringWithDamping: Constant.Animation.damping, initialSpringVelocity: Constant.Animation.velocity, options: .curveEaseInOut, animations: {
            self.alpha = 1
            self.transform = .init(scaleX: 1, y: 1)
        })
    }
    
    private func animateToDisappear() {
        guard !self._isDeactived else {
            return
        }
        
        self._isDeactived = true
        
        UIView.animate(withDuration: ToastManager.Setting.Duration.animation, delay: 0, usingSpringWithDamping: Constant.Animation.damping, initialSpringVelocity: Constant.Animation.velocity, options: .curveEaseInOut, animations: {
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
