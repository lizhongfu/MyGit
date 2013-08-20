//
//  ZFView.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZFView.h"

@implementation ZFView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor (context, 0.363, 0.263, 0.163, 1);
       
    UIBezierPath*    aPath = [UIBezierPath bezierPath];
    
    [aPath moveToPoint:CGPointMake(100.0, 0.0)];
    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40.0, 140)];
    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
    
    [aPath closePath];
    [aPath fill];
}


@end
