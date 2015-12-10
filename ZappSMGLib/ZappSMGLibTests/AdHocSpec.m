//
//  AdHocSpec.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <XCTest/XCTest.h>

@import ZappSMGLib;

@interface AdHocSpec : XCTestCase

@end

@implementation AdHocSpec
{
    AdHoc *_adHoc;
}

- (void)setUp
{
    [super setUp];
    
    _adHoc = [[AdHoc alloc] init];
}

- (void)testAdHocMembers
{
    XCTAssertNotNil(_adHoc);
    
    _adHoc.value = @"testValue";
    _adHoc.key = @"testKey";
    
    XCTAssertEqualObjects(_adHoc.value, @"testValue");
    XCTAssertEqualObjects(_adHoc.key, @"testKey");
}

@end
