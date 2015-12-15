//
//  ZLAppUtils.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kZappAppScheme;

@interface ZLAppUtils : NSObject

/**
 *  Checks if there is any of the CFI apps installed on the device support PBBA payment.
 *
 *  @return YES if CFI apps installed on the device support PBBA payment.
 */
+ (BOOL)isZappCFIAppAvailable;

/**
 *  Open PBBA enabled CFI application.
 *
 *  @param aptId  used to build the app url
 *  @param aptrId used to build the app url
 */
+ (void)openZappCFIAppWithAtpId:(NSString *)aptId aptrId:(NSString *)aptrId;

@end
