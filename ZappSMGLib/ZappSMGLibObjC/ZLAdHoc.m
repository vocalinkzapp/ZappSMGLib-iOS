//
//  ZLAdHoc.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "ZLAdHoc.h"

@implementation ZLAdHoc

- (instancetype)initWithKey:(NSString *)key
                      value:(NSString *)value
{
    if (self = [super init]) {
        self.key = key;
        self.value = value;
    }
    
    return self;
}

@end
