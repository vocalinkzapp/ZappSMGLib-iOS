//
//  LiteAddressDetails.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

@objc public class LiteAddressDetails : NSObject, Validatable {
    
    public var addressId: String?
    
    public var firstName: String
    
    public var lastName: String?
    
    public var addressLine1: String
    
    public var addressLine2: String?
    
    public var addressLine3: String?
    
    public var addressLine4: String?
    
    public var postCode: String?
    
    public init(addressId: String?, firstName: String, lastName: String?, addressLine1: String, addressLine2: String?, addressLine3: String?, addressLine4: String?, postCode: String?) {
        
        self.addressId = addressId
        self.firstName = firstName
        self.lastName = lastName
        self.addressLine1 = addressLine1
        self.addressLine2 = addressLine2
        self.addressLine3 = addressLine3
        self.addressLine4 = addressLine4
        self.postCode = postCode
    }
    
    /**
     Execute validation.
     
     - throws: ZappModelValidationError
     */
    public func validate() throws {
        // No extra validation required
    }
}