//
//  ZLLitePaymentStatusResponse.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLValidatable.h"
#import "ZLLitePaymentStatus.h"
#import "ZLLitePaymentStatusDescription.h"
#import "ZLLiteSettlementType.h"

@class ZLAdHoc;

@interface ZLLitePaymentStatusResponse : NSObject <ZLValidatable>

/**
 *  The payment status.
 */
@property (nonatomic, assign) NSInteger txnStatus;

/**
 *  Additional description about the payment status. Optional.
 */
@property (nonatomic, assign) NSInteger txnStatusDesc;

/**
 *  This value is the same as the LitePaymentRequest.totalAmount. Optional.
 */
@property (nonatomic, assign) long settlementAmount;

/**
 *  The payment reference data provided by the CFI. Optional.
 */
@property (nonatomic, copy) NSString *settlementPaymentRef;

/**
 *  Additional information for the Merchant about the channel the CFI used to make the payment (e.g. ONUS or FPS). Optional.
 */
@property (nonatomic, assign) NSInteger settlementT;

/**
 *  This value is the same as the LitePaymentRequest.adHoc. Optional.
 */
@property (nonatomic, strong) ZLAdHoc *adHoc;

/**
 *  Return the value of the txnStatus field as LitePaymentStatus instance.
 */
@property (nonatomic, readonly) ZLLitePaymentStatus paymentStatus;

/**
 *  Return the value of the txnStatusDesc field as LitePaymentStatusDescription instance.
 */
@property (nonatomic, readonly) ZLLitePaymentStatusDescription paymentStatusDescription;

/**
 *  Return the value of the settlementType field as LiteSettlementType instance.
 */
@property (nonatomic, readonly) ZLLiteSettlementType settlementType;

- (instancetype)initWithTxnStatus:(NSInteger)txtStatus
                    txnStatusDesc:(NSInteger)txnStatusDesc
                 settlementAmount:(long)settlementAmount
             settlementPaymentRef:(NSString *)settlementPaymentRef
                   settlementType:(NSInteger)settlementType
                            adHoc:(ZLAdHoc *)adHoc;

@end
