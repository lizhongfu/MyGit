//
//  TransformViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-14.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformView : UIView

@end

@implementation TransformView

- (void) drawRect:(CGRect)rect
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rectangle = CGRectMake(10, 10, 200, 300);
    
//    路径上变换－向右移动，高度不变
    CGAffineTransform transform = CGAffineTransformMakeTranslation(100, 0);
    
    CGPathAddRect(path, &transform, rectangle);
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(currentContext, path);
    
    [[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1.0] setFill];
    
    [[UIColor brownColor] setStroke];
    
    CGContextSetLineWidth(currentContext, 5.0);
    
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    CGPathRelease(path);
}

@end

@implementation TransformViewController

- (void) loadView
{
    self.view = [TransformView new];
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame = [ViewManager mainWindowFrame];
}

@end
