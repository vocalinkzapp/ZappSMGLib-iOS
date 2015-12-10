//
//  CurrencyAmountSpec.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <XCTest/XCTest.h>

@import ZappSMGLib;

@interface CurrencyAmountSpec : XCTestCase

@end

@implementation CurrencyAmountSpec
{
    CurrencyAmount *_amount;
}

- (void)setUp
{
    [super setUp];
    
    _amount = [[CurrencyAmount alloc] initWithValue:123456 currencyCode:nil];
}

- (void)testCurrencyAmountMembers
{
    XCTAssertNotNil(_amount);
    
    _amount.value = 10;
    
    XCTAssertEqual(_amount.value, 10);
    XCTAssertEqualObjects(_amount.currencyCode, [CurrencyAmount Pounds]);
}

- (void)testValidation
{
    NSError *error;
    [_amount validateAndReturnError:&error];
    
    XCTAssertNil(error);
}

- (void)testDisplayString
{
    XCTAssertEqualObjects([_amount displayString], @"£1234.56");
    
    _amount.value = 12;
    XCTAssertEqualObjects([_amount displayString], @"12p");
}

@end
