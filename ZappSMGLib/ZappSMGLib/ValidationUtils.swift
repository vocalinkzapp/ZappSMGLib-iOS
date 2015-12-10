//
//  ValidationUtils.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

@objc public class ValidationUtils : NSObject {
    
    public static func require(value: String?, fieldName: String) throws {
        
        guard let value = value where value.isEmpty == false else {
            throw ZappModelValidationError.Error(message: "Missing required field: \(fieldName)")
        }
    }
}