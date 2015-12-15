//
//  ViewController.m
//  ZappSMGLibDemoObjC
//
//  Created by Alexandru Maimescu on 12/10/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "ViewController.h"

#import "ZappSMGLibDemoObjC-Swift.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet PBBAButton *pbbaButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.pbbaButton.tapHandler = ^(PBBAButton *button) {
        
        NSLog(@"Did tap button!");
        
        double delayTime = dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC);
        dispatch_after(delayTime, dispatch_get_main_queue(), ^(void){
            [button stopAnimating];
            [AppUtils openZappCFIApp:@"12345" aptrId:@"12345"];
        });
    };
}

@end
