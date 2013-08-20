//
//  ScaleViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-14.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ScaleViewController.h"

@interface ScaleView : UIView

@end

@implementation ScaleView

- (void) drawRect:(CGRect)rect
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rectangle = CGRectMake(10, 10, 200, 300);
    
    CGPathAddRect(path, NULL, rectangle);
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(currentContext);
    
    CGContextScaleCTM(currentContext, 0.5, 0.5);
    
    CGContextAddPath(currentContext, path);
    
    [[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1.0] setFill];
    [[UIColor brownColor] setStroke];
    
    CGPathRelease(path);
    
    CGContextRestoreGState(currentContext);
    
//    other
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    CGRect rectangle1 = CGRectMake(310, 10, 200, 300);
    
    CGAffineTransform transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    CGPathAddRect(path1, &transform, rectangle1);
    
    CGContextAddPath(currentContext, path1);
    
    [[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1.0] setFill];
    [[UIColor brownColor] setStroke];
    
    CGContextSetLineWidth(currentContext, 5.0);
    
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    CGPathRelease(path1);
}

@end

@implementation ScaleViewController

- (void) loadView
{
    self.view = [ScaleView new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame = [ViewManager mainWindowFrame];
}

@end
