//
//  ToastContainerView.swift
//  ToastQueue
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import Foundation

import Then


final class ToastContainerView: BaseView {
    @IBOutlet weak var messageStackView: UIStackView!
    
    
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
        
        self.messageStackView.do {
            $0.spacing = ToastManager.Setting.Messages.spacing
            $0.alignment = .center
        }
    }
    
    
    func appendMessageView(_ model: ToastMessageModel) {
        let view: ToastMessageView = self.createMessageView(model)
        
        self.messageStackView.addArrangedSubview(view)
        
        self.clearOverflowedMessageViewsIfNeeded()
    }
    
    
    private func clearOverflowedMessageViewsIfNeeded() {
        let views: [ToastMessageView] = self.messageStackView.arrangedSubviews.compactMap { $0 as? ToastMessageView }
        let overflowedViewsCount: Int = max(views.count - ToastManager.Setting.Messages.maxCount, 0)
        
        guard overflowedViewsCount > 0 else {
            return
        }
        
        views.enumerated().filter { $0.offset < overflowedViewsCount }.forEach {
            $0.element.hide()
        }
    }
    
    
    private func createMessageView(_ model: ToastMessageModel) -> ToastMessageView {
        let view: ToastMessageView = .init()
        
        view.model = model
        
        return view
    }
}
