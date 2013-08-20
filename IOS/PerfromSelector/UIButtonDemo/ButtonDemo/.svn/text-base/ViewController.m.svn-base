//
//  ViewController.m
//  ButtonDemo
//
//  Created by Zogful.Lee on 13-3-26.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    GradientButton *bt = [[[ButtonHelper sharedButtonHelper] useAlertStyle] retain];
//    
//    [self.view addSubview:bt];
    CGRect viewFrame = CGRectMake(0, 0, 320, 44);
    NavBarBackgroundGradientView *aView = [[NavBarBackgroundGradientView alloc] initWithFrame:viewFrame];
    [self.view addSubview:aView];
    
    GradientButton *bt = [GradientButton buttonWithType:UIButtonTypeCustom];
    [bt useBlackStyle];
    bt.frame = CGRectMake(50, 90, 220, 44);
    [self.view addSubview:bt];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
