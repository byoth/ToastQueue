//
//  UIWindow+Extension.swift
//  ToastQueue
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import Foundation


extension UIWindow {
    public func getHighestViewController() -> UIViewController? {
        var result: UIViewController? = self.rootViewController
        
        while let presentedViewController = result?.presentedViewController {
            result = presentedViewController
        }
        
        return result
    }
}
