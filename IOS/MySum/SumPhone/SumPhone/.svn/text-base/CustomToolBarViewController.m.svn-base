//
//  CustomToolBarViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomToolBarViewController.h"

@interface CustomToolBarViewController ()

@end

@implementation CustomToolBarViewController

+ (NSString *)friendlyName {
    return @"UIToolBar自定义";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CustomToolBar *tb = [[CustomToolBar alloc] initWithFrame:CGRectMake(0, 300, 320, 44)];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    for (int i=0; i<5; i++) {
        UIBarButtonItem *mBarButtonItemTextField = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"%d", i] style:UIBarButtonItemStyleBordered target:nil action:nil];
        
        [array addObject:mBarButtonItemTextField];
    }
    tb.items = array;
    
    [self.view addSubview:tb];
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
