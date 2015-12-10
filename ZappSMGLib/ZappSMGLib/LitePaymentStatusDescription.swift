//
//  LitePaymentStatusDescription.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

/**
 *  The list of payment status descriptions.
 */
@objc public enum LitePaymentStatusDescription: Int {
    
    case Declined
    case LateAuthorised
    case LateDeclined
    case ProcessingError
    case TransactionError
}