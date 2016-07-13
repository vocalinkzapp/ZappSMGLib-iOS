//
//  ZLCurrencyAmount.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLValidatable.h"

/**
 *  The default currency code (GBP).
 */
extern NSString * const kZLDefaultCurrencyCode;

/**
 *  The currency amount.
 */
@interface ZLCurrencyAmount : NSObject <ZLValidatable>

/**
 *  Please do not use this, it will assert / crash in Debug. Use the convenience methods below. This will ensure that valid models are created.
 *
 *  @return nil
 */
- (instancetype)init;

/**
 *  Default initialiser for ZLCurrencyAmount
 *
 *  @param value        The amount of currency. Mandatory. Whole numbers only. Currency Code will determine where and how the decimal values are determined.
 *  @param currencyCode currencyCode as appropriate from ISO 4217. Mandatory
 *
 *  @return ZLCurrencyAmount if all mandatory values provided.
 */
- (instancetype)initWithValue:(long)value
                 currencyCode:(NSString *)currencyCode;

/**
 *  Convenience method for the creation of a ZLCurrencyAmount
 *
 *  @param value The amount of currency. Mandatory. Whole numbers only. Currency Code will determine how decimal values are determined.
 *
 *  Note,
 *  The currencyCode will default to "GBP" as per [ISO 4217](http://en.wikipedia.org/wiki/ISO_4217)
 *
 *  @return ZLCurrencyAmount if all mandatory values provided.
 */
- (instancetype)initWithValue:(long)value;

/**
 *  Add the given currency amount to the current one.
 *
 *  @param currencyAmount The currency amount to be added.
 *
 *  @return the result of currency amount after adding.
 */
- (instancetype)add:(ZLCurrencyAmount *)currencyAmount;

/**
 *  Subtracts the given currency amount from the current one.
 *
 *  @param currencyAmount The currency amount to be subtracted.
 *
 *  @return the result of currency amount after subtraction.
 */
- (instancetype)subtract:(ZLCurrencyAmount *)currencyAmount;

/**
 *  Multiply the current currency amount with the given quantity.
 *
 *  @param quantity The quantity to multiply with.
 *
 *  @return the result of currency amount after multiplication.
 */
- (instancetype)multiplyByQuantity:(long)quantity;

/**
 *  The currency value.
 */
@property (nonatomic, assign) long value;

/**
 *  The currency code.
 */
@property (nonatomic, copy) NSString *currencyCode;

/**
 *  Get the amount as string.
 */
@property (nonatomic, readonly, copy) NSString *displayString;

@end
