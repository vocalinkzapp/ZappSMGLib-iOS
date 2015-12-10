//
//  LiteMerchant.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

@objc public class LiteMerchant : NSObject, Validatable {
    
    /// The unique merchant id assigned to merchant and it must be supplied in payment request message.
    public var merchantId: String?
    
    /// The merchant sequence which will be incremented for each added client and merchant will pass this as part of Adhoc
    /// field when submitting payment request.
    public var merchantClientSequence: String?
    
    /// Admin password to control administrative activities.
    public var passcode: String?
    
    /// The name of the merchant.
    public var merchantName: String?
    
    /// The merchant's company registration number.
    public var companyRegistrationNumber: String?
    
    /// The company name of the merchant organisation.
    public var companyName: String?
    
    /// The company VAT number of merchant organisation.
    public var companyVATNumber: String?
    
    /// The company sort code of merchant organisation.
    public var companySortCode: String?
    
    /// The company account number of merchant organisation.
    public var companyAccountNumber: String?
    
    /// The company registered address of merchant organisation.
    public var companyRegisteredAddress: LiteAddressDetails?
    
    /// The dictionary representation of mobile app preferences and it will be returned when merchant is adding more client as new till.
    public var mobileAppPreference: Dictionary<String, AnyObject>?
    
    public init(merchantId: String?,
                merchantClientSequence: String?,
                passcode: String?,
                merchantName: String?,
                companyRegistrationNumber: String?,
                companyName: String?,
                companyVATNumber: String?,
                companySortCode: String?,
                companyAccountNumber: String?,
                companyRegisteredAddress: LiteAddressDetails?,
                mobileAppPreference: Dictionary<String, AnyObject>?) {
        
        self.merchantId = merchantId
        self.merchantClientSequence = merchantClientSequence
        self.passcode = passcode
        self.merchantName = merchantName
        self.companyRegistrationNumber = companyRegistrationNumber
        self.companyName = companyName
        self.companyVATNumber = companyVATNumber
        self.companySortCode = companySortCode
        self.companyAccountNumber = companyAccountNumber
        self.companyRegisteredAddress = companyRegisteredAddress
        self.mobileAppPreference = mobileAppPreference
    }
    
    /**
     Execute validation.
     
     - throws: ZappModelValidationError
     */
    public func validate() throws {
        // No extra validation required
    }
}