//
//  ZLAdHoc.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Ad hoc data structure.
 */
@interface ZLAdHoc : NSObject

/**
 *  Key (max length is 255 characters)
 */
@property (nonatomic, copy) NSString *key;

/**
 *  Value (max length is 255 characters)
 */
@property (nonatomic, copy) NSString *value;

- (instancetype)initWithKey:(NSString *)key
                      value:(NSString *)value;

@end
