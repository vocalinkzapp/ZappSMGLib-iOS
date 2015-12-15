//
//  ZLLiteMerchant.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "ZLLiteMerchant.h"
#import "ZLLiteAddressDetails.h"

@implementation ZLLiteMerchant

- (instancetype)initWithMerchantId:(NSString *)merchantId
            merchantClientSequence:(NSString *)merchantClientSequence
                          passcode:(NSString *)passcode
                      merchantName:(NSString *)merchantName
         companyRegistrationNumber:(NSString *)companyRegistrationNumber
                       companyName:(NSString *)companyName
                  companyVATNumber:(NSString *)companyVATNumber
                   companySortCode:(NSString *)companySortCode
              companyAccountNumber:(NSString *)companyAccountNumber
          companyRegisteredAddress:(ZLLiteAddressDetails *)companyRegisteredAddress
               mobileAppPreference:(NSDictionary *)mobileAppPreference
{
    if (self = [super init]) {
        
        self.merchantId = merchantId;
        self.merchantClientSequence = merchantClientSequence;
        self.passcode = passcode;
        self.merchantName = merchantName;
        self.companyRegistrationNumber = companyRegistrationNumber;
        self.companyName = companyName;
        self.companyVATNumber = companyVATNumber;
        self.companySortCode = companySortCode;
        self.companyAccountNumber = companyAccountNumber;
        self.companyRegisteredAddress = companyRegisteredAddress;
        self.mobileAppPreference = mobileAppPreference;
        
        if ([self _validate] == NO) {
            return nil;
        }
    }
    
    return self;
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
