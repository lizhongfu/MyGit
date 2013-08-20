//
//  GetRGBOfColorViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GetRGBOfColorViewController.h"

@interface GetRGBOfColorViewController ()

@end

@implementation GetRGBOfColorViewController

+ (NSString *)friendlyName {
    return @"UIColor获取RGB值";
}

- (void) getRGBValues {
    CGFloat R, G, B;
    
    UIColor *uiColor = (UIColor *)colorView.backgroundColor;
    CGColorRef color = [uiColor CGColor];
    int numComponents = CGColorGetNumberOfComponents(color);
    NSLog(@"numComponents:%d", numComponents);
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        R = components[0];
        G = components[1];
        B = components[2];
    }
    
    [showColorInfo setText:[NSString stringWithFormat:@"R:%f\nG:%f\nB:%f\n", (float)R, (float)G, (float)B]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    [getColorInfo addTarget:self action:@selector(getRGBValues) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
