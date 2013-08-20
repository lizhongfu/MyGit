//
//  CustomAlertFrame.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomAlertFrameViewController.h"

@interface CustomAlertFrameViewController ()

@end

@implementation CustomAlertFrameViewController

@synthesize _theLoadBox;


+ (NSString *)friendlyName {
    return @"UIAlert重载大小";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = BaseFrame;
    
	_theLoadBox = [[SuperLoadingBox alloc] initWithTitle:nil message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
	[(UIAlertView *)_theLoadBox show];
	
	
	 renderTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f
															target:self
														  selector:@selector( updateGLView ) 
                                                  userInfo:nil repeats:NO];
	
}

- (void) updateGLView {
    [_theLoadBox dismissWithClickedButtonIndex:0 animated:YES];
}

- (void) dealloc {
    
    [_theLoadBox release];
    renderTimer = nil;
    
    [super dealloc];
}

@end
