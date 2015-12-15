//
//  ZLLiteTransaction.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "ZLLiteTransaction.h"
#import "NSString+ZLUtils.h"

@implementation ZLLiteTransaction

- (instancetype)init
{
    NSAssert(NO, @"ZLLiteTransaction: Please use the approprite convenience method.");
    return nil;
}

- (instancetype)initWithAptId:(NSString *)aptId
                       aptrId:(NSString *)aptrId
      retrievalExpiryInterval:(NSInteger)retrievalExpiryInterval
   confirmationExpiryInterval:(NSInteger)confirmationExpiryInterval
        settlementRetrievalId:(NSString *)settlementRetrievalId
{
    if (self = [super init]) {
        self.aptId = aptId;
        self.aptrId = aptrId;
        self.retrievalExpiryInterval = retrievalExpiryInterval;
        self.confirmationExpiryInterval = confirmationExpiryInterval;
        self.settlementRetrievalId = settlementRetrievalId;
        
        if ([self _validate] == NO) {
            return nil;
        }
    }
    
    return self;
}

#pragma mark - ZPCValidatable

- (BOOL)_validate
{
    BOOL isAptIdValid = NSStringIsNotEmpty(self.aptId);
    BOOL isAptrIdValid = NSStringIsNotEmpty(self.aptrId);
    BOOL isSettlementRetrievalIdValid = NSStringIsNotEmpty(self.settlementRetrievalId);
    
    NSAssert(isAptIdValid, @"AptId is a mandatory field");
    NSAssert(isAptrIdValid, @"AptrId is a mandatory field");
    NSAssert(isSettlementRetrievalIdValid, @"SettlementRetrievalId is a mandatory field");
    
    return isAptIdValid && isAptIdValid && isSettlementRetrievalIdValid;
}

- (BOOL)validate
{
    return [self _validate];
}

@end
