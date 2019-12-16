//
//  UIWindow+Extension.swift
//  ToastQueue
//
//  Created by Taehyun Jo on 2019/12/16.
//  Copyright © 2019 byo. All rights reserved.
//

import Foundation


extension UIWindow {
    func topMostController() -> UIViewController? {
        guard let rootViewController = self.rootViewController else {
            return nil
        }
        
        var controller = rootViewController
        
        while let presentedController = controller.presentedViewController {
            controller = presentedController
        }
        
        return controller
    }
}
