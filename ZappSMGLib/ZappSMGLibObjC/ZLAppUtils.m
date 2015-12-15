//
//  ZLAppUtils.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLAppUtils.h"
#import "NSString+ZLUtils.h"

NSString * const kZappAppScheme = @"zapp://";

@implementation ZLAppUtils

+ (BOOL)isZappCFIAppAvailable
{
    NSURL *zappURLScheme = [NSURL URLWithString:kZappAppScheme];
    BOOL appAvailable = [[UIApplication sharedApplication] canOpenURL:zappURLScheme];
    
    return appAvailable;
}

+ (void)openZappCFIAppWithAtpId:(NSString *)aptId aptrId:(NSString *)aptrId
{
    if (NSStringIsEmpty(aptId) || NSStringIsEmpty(aptrId)) {
        return;
    }
    
    if ([self isZappCFIAppAvailable] == NO) {
        return;
    }
    
    NSURL *appUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", kZappAppScheme, aptId, aptrId]];
    [[UIApplication sharedApplication] openURL:appUrl];
}

@end
