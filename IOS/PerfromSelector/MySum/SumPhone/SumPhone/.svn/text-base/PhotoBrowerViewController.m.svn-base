//
//  PhotoBrowerViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoBrowerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PhotoBrowerViewController ()

@end

@implementation PhotoBrowerViewController

+ (NSString *)friendlyName {
    return @"UIImage相册效果";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 225.0)];
	view.center = self.view.center;
	view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | 
    UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
	view.layer.contents = (id)[UIImage imageNamed:@"photo.jpeg"].CGImage;
	view.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
	view.layer.borderWidth = 5.0;
	view.layer.shadowOffset = CGSizeMake(0, 9);
	view.layer.shadowOpacity = 0.7;	
	view.layer.shouldRasterize = YES;
    
    // shadow
    UIBezierPath *path = [UIBezierPath bezierPath];	
	
	CGPoint topLeft		 = view.bounds.origin;
	CGPoint bottomLeft	 = CGPointMake(0.0, CGRectGetHeight(view.bounds) + 10);
	CGPoint bottomMiddle = CGPointMake(CGRectGetWidth(view.bounds) / 2, CGRectGetHeight(view.bounds) - 5);	
	CGPoint bottomRight	 = CGPointMake(CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds) + 10);
	CGPoint topRight	 = CGPointMake(CGRectGetWidth(view.bounds), 0.0);
	
	[path moveToPoint:topLeft];
	[path addLineToPoint:bottomLeft];
    
    //    添加一条曲线，设置末点和中间点
	[path addQuadCurveToPoint:bottomRight
				 controlPoint:bottomMiddle];
    
	[path addLineToPoint:topRight];
	[path addLineToPoint:topLeft];
	[path closePath];
	
	view.layer.shadowPath = path.CGPath;	
	
	[self.view addSubview:view];
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
