//
//  LitePaymentStatus.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

/**
 *  The list of payment statuses.
 */
@objc public enum LitePaymentStatus: Int {
    
    /**
     *  The payment transaction is not Authorised or Declined, it is still being processed.
     */
    case InProgress
    
    /**
     *  The payment transaction was successful and authorised by the FI.
     */
    case Authorised
    
    /**
     *  The payment transaction was declined.
     */
    case Declined
    
    /**
     *  Incomplete. The payment transaction is in logical state of ‘Retrieval Timeout’, ‘Late Retrieval’, ‘Confirmation Timeout’, ‘Late Authorised’, ‘Late Consumer
     *  Declined’ or ‘Late FI Declined’.
     */
    case Incomplete
    
    /**
     *  Transaction error if an payment status enquiry fails for a technical reason.
     */
    case PaymentEnquiryFailed
    
    /**
     *  When the deferred order is authorised but awaiting settlement.
     */
    case AwaitingSettlement
}