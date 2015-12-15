//
//  ZLLitePaymentStatus.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#ifndef ZLLitePaymentStatus_h
#define ZLLitePaymentStatus_h

#import <Foundation/Foundation.h>

/**
 *  The list of payment statuses.
 */
typedef NS_ENUM(NSInteger, ZLLitePaymentStatus) {
    /**
     *  The payment transaction is not Authorised or Declined, it is still being processed.
     */
    ZLLitePaymentStatusInProgress,
    /**
     *  The payment transaction was successful and authorised by the FI.
     */
    ZLLitePaymentStatusAuthorised,
    /**
     *  The payment transaction was declined.
     */
    ZLLitePaymentStatusDeclined,
    /**
     *  Incomplete. The payment transaction is in logical state of ‘Retrieval Timeout’, ‘Late Retrieval’, ‘Confirmation Timeout’, ‘Late Authorised’, ‘Late Consumer
     *  Declined’ or ‘Late FI Declined’.
     */
    ZLLitePaymentStatusIncomplete,
    /**
     *  Transaction error if an payment status enquiry fails for a technical reason.
     */
    ZLLitePaymentStatusPaymentEnquiryFailed,
    /**
     *  When the deferred order is authorised but awaiting settlement.
     */
    ZLLitePaymentStatusAwaitingSettlement
};

#endif /* ZLLitePaymentStatus_h */
