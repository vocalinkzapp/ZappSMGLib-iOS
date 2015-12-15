//
//  ZLLitePaymentRequest.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLValidatable.h"

@class ZLAdHoc;

/**
 * Lite payment request model class.
 */
@interface ZLLitePaymentRequest : NSObject <ZLValidatable>

/**
 *  The total amount for which the merchant would like to get the payment made by the customer.
 */
@property (nonatomic, assign) long totalAmount;

/**
 *  A Zapp provided data after the merchant is successfully registered.
 */
@property (nonatomic, copy) NSString *merchantId;

/**
 *  A unique ID for the merchant that represents a purchase. Conditional: the merchant could choose not to generate this ID and let Zapp gateway generate it (this
 *  should be decided as part of merchant registration.
 */
@property (nonatomic, copy) NSString *rtpId;

/**
 *  Key - value pair information that the merchant can use in order for Zapp to relay back the same during payment notification. Optional.
 */
@property (nonatomic, strong) ZLAdHoc *adHoc;

/**
 *  Merchant app callback string.
 */
@property (nonatomic, copy) NSString *merchantCallbackUrl;

- (instancetype)initWithTotalAmount:(long)totalAmount
                         merchantId:(NSString *)merchantId
                              rtpId:(NSString *)rtpId
                              adHoc:(ZLAdHoc *)adHoc
                merchantCallbackUrl:(NSString *)merchantCallbackUrl;

@end
