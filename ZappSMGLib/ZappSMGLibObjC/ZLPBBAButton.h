//
//  ZLPBBAButton.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZLAnimatable <NSObject>

- (BOOL)isAnimating;
- (void)startAnimating;
- (void)stopAnimating;

@end

@interface ZLPBBAButton : UIControl <ZLAnimatable>

/**
 *  Assign a tap handler block
 */
@property (nonatomic, copy) void (^tapHandler)(ZLPBBAButton *);

@end
