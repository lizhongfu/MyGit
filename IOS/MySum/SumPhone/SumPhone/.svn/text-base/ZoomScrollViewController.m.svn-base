//
//  ZoomScrollViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZoomScrollViewController.h"

@interface ZoomScrollViewController ()

@end

@implementation ZoomScrollViewController
@synthesize testImageView, myScrollView;

+ (NSString *)friendlyName {
    return @"UIScrollView缩放实现";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	myScrollView.delegate = self;
	
	testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	testImageView.image = [UIImage imageNamed:@"CMT_iPhone_001.png"];
	
	[myScrollView addSubview:testImageView];
	myScrollView.minimumZoomScale = 0.1;
	myScrollView.maximumZoomScale = 3.0;
	
	[self.view addSubview:myScrollView];
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return testImageView;
}

@end
