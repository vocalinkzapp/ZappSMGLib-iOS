//
//  NSString+ZLUtils.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Check for empty string function.
 *
 *  @return YES if string is empty
 */
BOOL NSStringIsEmpty(NSString *string);

/**
 *  Check for non empty string function.
 *
 *  @return YES if string is not empty
 */
BOOL NSStringIsNotEmpty(NSString *string);

@interface NSString (ZLUtils)

@end
