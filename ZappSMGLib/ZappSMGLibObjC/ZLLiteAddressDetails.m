//
//  ZLLiteAddressDetails.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "ZLLiteAddressDetails.h"
#import "NSString+ZLUtils.h"

@implementation ZLLiteAddressDetails

- (instancetype)init
{
    NSAssert(NO, @"ZLLiteAddressDetails: Please use the approprite convenience method.");
    return nil;
}

- (instancetype)initWithAddressId:(NSString *)addressId
                        firstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            line1:(NSString *)line1
                            line2:(NSString *)line2
                            line3:(NSString *)line3
                            line4:(NSString *)line4
                         postCode:(NSString *)postCode
{
    if (self = [super init]) {
        
        self.addressId = addressId;
        self.firstName = firstName;
        self.lastName = lastName;
        self.line1 = line1;
        self.line2 = line2;
        self.line3 = line3;
        self.line4 = line4;
        
        if ([self _validate] == NO) {
            return nil;
        }
    }
    
    return self;
}

#pragma mark - ZPCValidatable

- (BOOL)_validate
{
    BOOL isFirstNameValid = NSStringIsNotEmpty(_firstName);
    BOOL isLine1Valid = NSStringIsNotEmpty(_line1);
    
    NSAssert(isFirstNameValid, @"First name is a mandatory field" );
    NSAssert(isLine1Valid, @"Line1 is a mandatory field" );
    
    return isLine1Valid && isFirstNameValid;
}

- (BOOL)validate
{
    return [self _validate];
}

@end
