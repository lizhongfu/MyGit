//
//  RectanglesViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-13.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RectanglesViewController.h"

@interface RectanglesView : UIView

@end

@implementation RectanglesView

- (void) drawRect:(CGRect)rect
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rectangle1 = CGRectMake(10, 10, 200, 300);
    CGRect rectangle2 = CGRectMake(40, 100, 90, 300);
    
    CGRect rectangles[2] = { rectangle1, rectangle2 };
    CGPathAddRects(path, NULL, rectangles, 2);
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(currentContext, path);
    
    [[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1.0] setFill];
    
    [[UIColor blackColor] setStroke];
    
    CGContextSetLineWidth(currentContext, 5.0f);
    
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    CGPathRelease(path);
}

@end

@implementation RectanglesViewController

- (void) loadView
{
    self.view = [RectanglesView new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.frame = [ViewManager mainWindowFrame];
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
