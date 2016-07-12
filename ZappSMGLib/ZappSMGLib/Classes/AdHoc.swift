//
//  AdHoc.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

/// Ad hoc data structure
@objc public class AdHoc: NSObject {
    
    /// Key (max length is 255 characters)
    public var key: String?
    
    /// Value (max length is 255 characters)
    public var value: String?
    
    public init(key: String?, value: String?) {
        
        self.key = key
        self.value = value
    }
}