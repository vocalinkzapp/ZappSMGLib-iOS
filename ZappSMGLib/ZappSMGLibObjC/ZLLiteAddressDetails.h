//
//  ZLLiteAddressDetails.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLValidatable.h"

/**
 *  Address details model objects for Lite merchant gateway.
 */
@interface ZLLiteAddressDetails : NSObject <ZLValidatable>

- (instancetype)initWithAddressId:(NSString *)addressId
                        firstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            line1:(NSString *)line1
                            line2:(NSString *)line2
                            line3:(NSString *)line3
                            line4:(NSString *)line4
                         postCode:(NSString *)postCode;

@property (nonatomic, copy) NSString *addressId;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *line1;
@property (nonatomic, copy) NSString *line2;
@property (nonatomic, copy) NSString *line3;
@property (nonatomic, copy) NSString *line4;
@property (nonatomic, copy) NSString *postCode;

@end
