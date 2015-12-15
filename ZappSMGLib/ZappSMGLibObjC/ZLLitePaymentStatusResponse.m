//
//  ZLLitePaymentStatusResponse.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "ZLLitePaymentStatusResponse.h"
#import "ZLAdHoc.h"

@implementation ZLLitePaymentStatusResponse

- (instancetype)initWithTxnStatus:(NSInteger)txtStatus
                    txnStatusDesc:(NSInteger)txnStatusDesc
                 settlementAmount:(long)settlementAmount
             settlementPaymentRef:(NSString *)settlementPaymentRef
                   settlementType:(NSInteger)settlementType
                            adHoc:(ZLAdHoc *)adHoc
{
    if (self = [super init]) {
        self.txnStatus = txtStatus;
        self.txnStatusDesc = txnStatusDesc;
        self.settlementAmount = settlementAmount;
        self.settlementPaymentRef = settlementPaymentRef;
        self.settlementT = settlementType;
        self.adHoc = adHoc;
        
        if ([self _validate] == NO) {
            return nil;
        }
    }
    
    return self;
}

- (ZLLitePaymentStatus)paymentStatus
{
    switch (self.txnStatus) {
        case 0:
            return ZLLitePaymentStatusAuthorised;
            break;
        case 1:
            return ZLLitePaymentStatusDeclined;
            break;
        case 2:
            return ZLLitePaymentStatusIncomplete;
            break;
        case 3:
            return ZLLitePaymentStatusInProgress;
            break;
        case 4:
            return ZLLitePaymentStatusPaymentEnquiryFailed;
            break;
        case 5:
            return ZLLitePaymentStatusAwaitingSettlement;
            break;
            
        default: {
            NSString *errorMessage = [NSString stringWithFormat:@"Unknown payment status: %ld", self.txnStatus];
            NSAssert(NO, errorMessage);
            return NSNotFound;
            break;
        }
    }
}

- (ZLLitePaymentStatusDescription)paymentStatusDescription
{
    switch (self.txnStatusDesc) {
        case 0:
            return ZLLitePaymentStatusDescriptionDeclined;
            break;
        case 1:
            return ZLLitePaymentStatusDescriptionLateAuthorised;
            break;
        case 2:
            return ZLLitePaymentStatusDescriptionLateDeclined;
            break;
        case 3:
            return ZLLitePaymentStatusDescriptionProcessingError;
            break;
        case 4:
            return ZLLitePaymentStatusDescriptionTransactionError;
            break;
            
        default: {
            NSString *errorMessage = [NSString stringWithFormat:@"Unknown payment status description: %ld", self.txnStatusDesc];
            NSAssert(NO, errorMessage);
            return NSNotFound;
            break;
        }
    }
}

- (ZLLiteSettlementType)settlementType
{
    switch (self.settlementT) {
        case 0:
            return ZLLiteSettlementTypeONUS;
            break;
        case 1:
            return ZLLiteSettlementTypeFPS_SIP;
            break;
        case 2:
            return ZLLiteSettlementTypeFPS_FDP;
            break;
            
        default: {
            NSString *errorMessage = [NSString stringWithFormat:@"Unknown settlement type: %ld", self.settlementT];
            NSAssert(NO, errorMessage);
            return NSNotFound;
            break;
        }
    }
}

#pragma mark - ZPCValidatable

- (BOOL)_validate
{
    return YES;
}

- (BOOL)validate
{
    return [self _validate];
}

@end
