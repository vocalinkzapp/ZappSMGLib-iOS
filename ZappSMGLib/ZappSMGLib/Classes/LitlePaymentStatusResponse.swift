//
//  LitlePaymentStatusResponse.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/9/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

/// Payment status response model object for Lite merchant gateway.
@objc public class LitePaymentStatusResponse: NSObject, Validatable {
    
    /// The payment status.
    public var txnStatus: Int
    
    /// Additional description about the payment status. Optional.
    public var txnStatusDesc: Int?
    
    /// This value is the same as the LitePaymentRequest.totalAmount. Optional.
    public var settlementAmount: CLong?
    
    /// The payment reference data provided by the CFI. Optional.
    public var settlementPaymentRef: String?
    
    /// Additional information for the Merchant about the channel the CFI used to make the payment (e.g. ONUS or FPS). Optional.
    public var settlementT: Int?
    
    /// This value is the same as the LitePaymentRequest.adHoc. Optional.
    public var adHoc: AdHoc?
    
    /// Return the value of the txnStatus field as LitePaymentStatus instance.
    public var paymentStatus: LitePaymentStatus? {
        
        switch txnStatus {
        case 0:
            return .Authorised
        case 1:
            return .Declined
        case 2:
            return .Incomplete
        case 3:
            return .InProgress
        case 4:
            return .PaymentEnquiryFailed
        case 5:
            return .AwaitingSettlement
            
        default:
            print("Unknown payment status: \(txnStatus)")
            return nil
        }
    }
    
    /// Return the value of the txnStatusDesc field as LitePaymentStatusDescription instance.
    public var paymentStatusDescription: LitePaymentStatusDescription? {
        
        guard let txnStatusDesc = txnStatusDesc else {
            return nil
        }
        
        switch txnStatusDesc {
        case 0:
            return .Declined
        case 1:
            return .LateAuthorised
        case 2:
            return .LateDeclined
        case 3:
            return .ProcessingError
        case 4:
            return .TransactionError
            
        default:
            print("Unknown payment status description: \(txnStatusDesc)")
            return nil
        }
    }
    
    /// Return the value of the settlementType field as LiteSettlementType instance.
    public var settlementType: LiteSettlementType? {
        
        guard let settlementType = settlementT else {
            return nil
        }
        
        switch settlementType {
        case 0:
            return .ONUS
        case 1:
            return .FPS_SIP
        case 2:
            return .FPS_FDP
            
        default:
            print("Unknown settlement type: \(settlementType)")
            return nil
        }
    }
    
    public init(txnStatus: Int, txnStatusDesc: Int?, settlementAmount: CLong?, settlementPaymentRef: String?, settlementType: Int?, adHoc: AdHoc?) {
        
        self.txnStatus = txnStatus
        self.txnStatusDesc = txnStatusDesc
        self.settlementAmount = settlementAmount
        self.settlementPaymentRef = settlementPaymentRef
        self.settlementT = settlementType
        self.adHoc = adHoc
    }
    
    /**
     Execute validation.
     
     - throws: ZappModelValidationError
     */
    func validate() throws {
        // No extra validation required
    }
}