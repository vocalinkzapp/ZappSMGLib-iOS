//
//  LiteAddressDetailsSpec.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/9/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <XCTest/XCTest.h>

@import ZappSMGLib;

@interface LiteAddressDetailsSpec : XCTestCase

@end

@implementation LiteAddressDetailsSpec
{
    LiteAddressDetails *_liteAddressDetails;
}

- (void)setUp
{
    [super setUp];

    _liteAddressDetails = [[LiteAddressDetails alloc] initWithAddressId:nil
                                                              firstName:@"firstName"
                                                               lastName:nil
                                                           addressLine1:@"line1"
                                                           addressLine2:nil
                                                           addressLine3:nil
                                                           addressLine4:nil
                                                               postCode:nil];
}

- (void)testLiteAddressDetailsMemember
{
    XCTAssertNotNil(_liteAddressDetails);
    
    _liteAddressDetails.addressId = @"addressId";
    _liteAddressDetails.lastName = @"lastName";
    _liteAddressDetails.addressLine1 = @"addressLine1";
    _liteAddressDetails.addressLine2 = @"addressLine2";
    _liteAddressDetails.addressLine3 = @"addressLine3";
    _liteAddressDetails.addressLine4 = @"addressLine4";
    _liteAddressDetails.postCode = @"postCode";
    
    XCTAssertEqualObjects(_liteAddressDetails.addressId, @"addressId");
    XCTAssertEqualObjects(_liteAddressDetails.firstName, @"firstName");
    XCTAssertEqualObjects(_liteAddressDetails.lastName, @"lastName");
    XCTAssertEqualObjects(_liteAddressDetails.addressLine1, @"addressLine1");
    XCTAssertEqualObjects(_liteAddressDetails.addressLine2, @"addressLine2");
    XCTAssertEqualObjects(_liteAddressDetails.addressLine3, @"addressLine3");
    XCTAssertEqualObjects(_liteAddressDetails.addressLine4, @"addressLine4");
    XCTAssertEqualObjects(_liteAddressDetails.postCode, @"postCode");
}

- (void)testValidation
{
    NSError *error;
    [_liteAddressDetails validateAndReturnError:&error];
    
    XCTAssertNil(error);
}

@end
