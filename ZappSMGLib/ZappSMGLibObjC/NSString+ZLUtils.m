//
//  NSString+ZLUtils.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "NSString+ZLUtils.h"

BOOL NSStringIsEmpty(NSString *string) {
    BOOL isEmpty = (string == nil || [string isEqualToString:@""]);
    return isEmpty;
}

BOOL NSStringIsNotEmpty(NSString *string) {
    return !NSStringIsEmpty(string);
}

@implementation NSString (ZLUtils)



@end
