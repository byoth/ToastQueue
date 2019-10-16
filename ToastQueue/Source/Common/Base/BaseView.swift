//
//  BaseView.swift
//  ToastQueue
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import Foundation


class BaseView: UIView {
    init() {
        super.init(frame: .zero)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
        self.setupNib()
        
        self.backgroundColor = .clear
    }
    
    private func setupNib() {
        guard let view = type(of: self).bundle.loadNibNamed(type(of: self).className, owner: self, options: nil)?.first as? UIView else {
            return
        }
        
        view.backgroundColor = .clear
        
        self.addSubview(view)
        
        view.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
