//
//  ZLValidatable.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#ifndef ZLValidatable_h
#define ZLValidatable_h

#import <Foundation/Foundation.h>

/**
 *  ZLValidatable
 *
 *  Classes conforming to this protocol will allow you to confirm that the model confirms to all validation rules.
 */
@protocol ZLValidatable <NSObject>

/**
 *  Validate model
 *
 *  @return YES if model is valid
 */
- (BOOL)validate;

@end

#endif /* ZLValidatable_h */

