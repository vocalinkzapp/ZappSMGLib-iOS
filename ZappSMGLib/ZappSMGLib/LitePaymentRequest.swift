//
//  LitePaymentRequest.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

@objc public class LitePaymentRequest : NSObject, Validatable {
    
    /// The total amount for which the merchant would like to get the payment made by the customer.
    public var totalAmount: CLong
    
    // Merchant app callback string
    public var merchantCallbackUrl: String
    
    /// A Zapp provided data after the merchant is successfully registered.
    public var merchantId: String
    
    /// A unique ID for the merchant that represents a purchase. Conditional: the merchant could choose not to generate this ID and let Zapp gateway generate it (this
    /// should be decided as part of merchant registration.
    public var rtpId: String?
    
    /// Key - value pair information that the merchant can use in order for Zapp to relay back the same during payment notification. Optional.
    public var adHoc: AdHoc?
    
    public init(totalAmount: CLong, merchantId: String, rtpId: String?, adHoc: AdHoc?, merchantCallbackUrl: String) {
        
        self.totalAmount = totalAmount
        self.merchantId = merchantId
        self.rtpId = rtpId
        self.adHoc = adHoc
        self.merchantCallbackUrl = merchantCallbackUrl
    }
    
    /**
     Execute validation.
     
     - throws: ZappModelValidationError
     */
    func validate() throws {
        // No extra validation required
    }
}