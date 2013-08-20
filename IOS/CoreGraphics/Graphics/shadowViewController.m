//
//  shadowViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-13.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "shadowViewController.h"

@interface shadowView : UIView

@end

@implementation shadowView

- (void) drawSecendRect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect secondRect = CGRectMake(150, 250, 100, 100);
    
    CGPathAddRect(path, NULL, secondRect);
    
    CGContextAddPath(currentContext, path);
    
    [[UIColor purpleColor] setFill];
    
    CGContextDrawPath(currentContext, kCGPathFill);
    
    CGPathRelease(path);
}

//blur 模糊
- (void) drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    保存图形上下文状态
    CGContextSaveGState(currentContext);
//    blur 模糊度
    CGContextSetShadowWithColor(currentContext, CGSizeMake(10, 10), 20, [UIColor grayColor].CGColor);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect firstRect = CGRectMake(55, 60, 150, 150);
    
    CGPathAddRect(path, NULL, firstRect);
    
    CGContextAddPath(currentContext, path);
    
    [[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1.0] setFill];
    
    CGContextDrawPath(currentContext, kCGPathFill);
    
    CGPathRelease(path);
    
//    恢复图形上下文，以便绘制接下来的图形，不然此图形上下文将延续到下一个绘制过程，这不是希望的
    CGContextRestoreGState(currentContext);
    
//    [self drawSecendRect];
}

@end


@implementation shadowViewController

- (void) loadView
{
    self.view = [shadowView new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.frame = [ViewManager mainWindowFrame];
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
