//
//  CustomShapeViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomShapeViewController.h"

@interface CustomShapeViewController ()

@end

@implementation CustomShapeViewController

+ (NSString *)friendlyName {
    return @"UIBezierPath不规则图形";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame = BaseFrame;
    
    ZFView *aView = [[ZFView alloc] initWithFrame:BaseFrame];
    aView.backgroundColor = [UIColor clearColor];
    
	[self.view addSubview:aView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
