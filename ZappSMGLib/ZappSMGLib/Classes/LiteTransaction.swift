//
//  LiteTransaction.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

/// Lite payment response model class.
@objc public class LiteTransaction : NSObject, Validatable {
    
    /// This is a unique id for the payment request generated by Zapp, mainly to be used by machine as it is a 37 characters long string.
    /// Note: this is the data that needs to be passed to the CFI App in the mobile device as part of the Zapp URL.
    public var aptId: String
    
    /// This is a unique id for the payment request generated by Zapp, mainly to be used by human as t is an 18 characters long string, this ID is used to
    /// retrieve payment status. A polling mechanism every 3-5 seconds is recommended.
    public var aptrId: String
    
    /// This data is in seconds. It is for the merchant for information purposes only. It is used by Zapp to mark a payment request as 'late retrieved' after
    /// this interval.
    public var retrievalExpiryInterval: Int
    
    /// This data is in seconds. It is for the merchant to poll for payment notification until this interval runs out and initiate an payment request enquiry
    /// after this.
    public var confirmationExpiryInterval: Int
    
    /// This is a unique id generated by Zapp for all payment requests. It should be used to enquire a payment status for the request which has been reached its
    /// confirmation expiry interval timeout.
    public var settlementRetrievalId: String
    
    public init(aptId: String, aptrId: String, retrievalExpiryInterval: Int, confirmationExpiryInterval: Int, settlementRetrievalId: String) {
        
        self.aptId = aptId
        self.aptrId = aptrId
        self.retrievalExpiryInterval = retrievalExpiryInterval
        self.confirmationExpiryInterval = confirmationExpiryInterval
        self.settlementRetrievalId = settlementRetrievalId
    }
    
    /**
     Execute validation.
     
     - throws: ZappModelValidationError
     */
    func validate() throws {
        // No extra validation required
    }
}