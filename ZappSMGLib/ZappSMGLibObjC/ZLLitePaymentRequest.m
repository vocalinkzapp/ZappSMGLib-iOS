//
//  ZLLitePaymentRequest.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "ZLLitePaymentRequest.h"
#import "ZLAdHoc.h"
#import "NSString+ZLUtils.h"

@implementation ZLLitePaymentRequest

- (instancetype)init
{
    NSAssert(NO, @"ZLLitePaymentRequest: Please use the approprite convenience method.");
    return nil;
}

- (instancetype)initWithTotalAmount:(long)totalAmount
                         merchantId:(NSString *)merchantId
                              rtpId:(NSString *)rtpId
                              adHoc:(ZLAdHoc *)adHoc
                merchantCallbackUrl:(NSString *)merchantCallbackUrl
{
    if (self = [super init]) {
        
        self.totalAmount = totalAmount;
        self.merchantId = merchantId;
        self.rtpId = rtpId;
        self.adHoc = adHoc;
        self.merchantCallbackUrl = merchantCallbackUrl;
        
        if ([self _validate] == NO) {
            return nil;
        }
    }
    
    return self;
}

#pragma mark - ZPCValidatable

- (BOOL)_validate
{
    BOOL isMerchantIdValid = NSStringIsNotEmpty(self.merchantId);
    BOOL isMerchantCallbackValid = NSStringIsNotEmpty(self.merchantCallbackUrl);
    
    NSAssert(isMerchantIdValid, @"Merchant ID is a mandatory field");
    NSAssert(isMerchantCallbackValid, @"Merchant callback string is a mandatory field");
    
    return isMerchantIdValid && isMerchantCallbackValid;
}

- (BOOL)validate
{
    return [self _validate];
}

@end
