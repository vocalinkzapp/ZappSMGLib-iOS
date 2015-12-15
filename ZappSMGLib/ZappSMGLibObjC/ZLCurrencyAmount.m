//
//  ZLCurrencyAmount.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "ZLCurrencyAmount.h"
#import "NSString+ZLUtils.h"

NSString * const kZLDefaultCurrencyCode = @"GBP";

@implementation ZLCurrencyAmount

- (instancetype) init
{
    NSAssert(NO, @"ZLCurrencyAmount: Please use the approprite convenience method.");
    return nil;
}

- (instancetype)initWithValue:(long)value
{
    return [self initWithValue:value currencyCode:kZLDefaultCurrencyCode];
}

- (instancetype)initWithValue:(long)value
                 currencyCode:(NSString *)currencyCode
{
    if (self = [super init]) {
        _value = value;
        _currencyCode = (currencyCode) ? currencyCode : kZLDefaultCurrencyCode;
        
        if ([self _validate] == NO) {
            self = nil;
        }
    }
    
    return self;
}

- (instancetype)add:(ZLCurrencyAmount *)currencyAmount
{
    if ([self validate] && [currencyAmount validate]) {
        if (self.currencyCode == currencyAmount.currencyCode) {
            self.value += currencyAmount.value;
            return self;
        }
        
        NSAssert(NO, @"The currency codes must match");
    }
    
    return nil;
}

- (instancetype)substract:(ZLCurrencyAmount *)currencyAmount
{
    if ([self validate] && [currencyAmount validate]) {
        if (self.currencyCode == currencyAmount.currencyCode) {
            self.value -= currencyAmount.value;
            return self;
        }
        
        NSAssert(NO, @"The currency codes must match");
    }
    
    return nil;
}

- (instancetype)multiplyByQuantity:(long)quantity
{
    if ([self validate]) {
        self.value *= quantity;
        return self;
    }
    
    return nil;
}

- (NSString *)displayString
{
    if (![self.currencyCode isEqualToString:kZLDefaultCurrencyCode]) {
        return nil;
    }
    
    NSString *displayString;
    NSString *sign = self.value >= 0 ? @"" : @"-";
    long poundsValue = labs(self.value / 100);
    long penceValue = labs(self.value % 100);
    
    if (poundsValue != 0) {
        displayString = [NSString stringWithFormat:@"%@£%ld.%02ld", sign, poundsValue, penceValue];
    } else {
        displayString = [NSString stringWithFormat:@"%@%ldp", sign, penceValue];
    }
    
    return displayString;
}

#pragma mark - ZPCValidatable

- (BOOL)_validate
{
    BOOL isCurrencyCodeValid = NSStringIsNotEmpty(self.currencyCode);
    
    NSAssert(isCurrencyCodeValid, @"Currency code is a mandatory field");
    
    return isCurrencyCodeValid;
}

- (BOOL)validate
{
    return [self _validate];
}

@end
