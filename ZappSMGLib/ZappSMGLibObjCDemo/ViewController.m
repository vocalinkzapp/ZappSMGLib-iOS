//
//  ViewController.m
//  ZappSMGLibObjCDemo
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "ViewController.h"
#import "ZappSMGLibObjC.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ZLPBBAButton *pbbaButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pbbaButton.tapHandler = ^(ZLPBBAButton *button) {
        
        NSLog(@"Did tap button!");
        
        double delayTime = dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC);
        dispatch_after(delayTime, dispatch_get_main_queue(), ^(void){
            [button stopAnimating];
            [ZLAppUtils openZappCFIAppWithAtpId:@"12345" aptrId:@"12345"];
        });
    };
}

@end
