//
//  NSObject+Extension.swift
//  ToastQueue
//
//  Created by Taehyun Jo on 16/10/2019.
//  Copyright © 2019 byo. All rights reserved.
//

import Foundation


extension NSObject {
    static var bundle: Bundle {
        return .init(for: self.classForCoder())
    }
    
    static var className: String {
        return self.description().components(separatedBy: ".").last ?? ""
    }
}
