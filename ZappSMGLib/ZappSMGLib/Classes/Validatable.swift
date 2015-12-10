//
//  Validatable.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

public enum ZappModelValidationError: ErrorType {
    case Error(message: String)
}

/**
 *  Enables validation for all classes which conforms to this protocol
 */
protocol Validatable {
    
    /**
     Execute validation.
     
     - throws: ZappModelValidationError
     */
    func validate() throws
}