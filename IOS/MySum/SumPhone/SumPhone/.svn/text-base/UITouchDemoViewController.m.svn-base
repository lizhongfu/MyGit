//
//  UITouchDemoViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UITouchDemoViewController.h"

@interface UITouchDemoViewController ()
{
    UIView *aView;
}
@end

@implementation UITouchDemoViewController

+ (NSString *)friendlyName {
    return @"UITouch自己的Demo";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float width = BaseFrame.size.width;
    float height = BaseFrame.size.height;
    
    aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height/2)];
    aView.tag = 10;
    aView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    [self.view addSubview:aView];
    [aView release];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

	NSSet *myTouches = [event touchesForView:[self.view viewWithTag:10]];
	NSInteger numTaps = [[myTouches anyObject] tapCount];//轻击次数
	NSInteger numtouches = [myTouches count];//触摸数量
	
	NSLog(@"numTaps=%d,numtouches=%d", numTaps,numtouches);
    //	
	CGPoint point = [[touches anyObject] locationInView:[self.view viewWithTag:10]];
	NSString *pointString = NSStringFromCGPoint(point);
	NSLog(@"点击处的坐标：%@", pointString);
	
}

@end
