//
//  PathDrawViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-13.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "PathDrawViewController.h"

@interface PathDrawView : UIView

@end

@implementation PathDrawView

- (void) drawRect:(CGRect)rect
{
//    创建一个可变路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect aRect = CGRectMake(50, 100, [ViewManager applicationFrame_width]-50-50, [ViewManager applicationFrame_height]-100-100);
    
//    在路径上移动当前画笔的位置到一个点
    CGPathMoveToPoint(path, NULL, aRect.origin.x, aRect.origin.y);
//    从当前画笔位置到指定的点，绘制线段
    CGPathAddLineToPoint(path, NULL, aRect.size.width, aRect.size.height);
    
    CGPathMoveToPoint(path, NULL, aRect.size.width, aRect.origin.y);
    CGPathAddLineToPoint(path, NULL, aRect.origin.x, aRect.size.height);
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextAddPath(currentContext, path);
    
    [[UIColor blueColor] setStroke];
    
//    添加一个路径（由句柄指定）到图形上下文，准备用于绘图
    CGContextDrawPath(currentContext, kCGPathStroke);
    
//    释放句柄分配的内存
    CGPathRelease(path);
}

@end

/*
 一系列点放在一起，构成了一个形状。一系列的形状放在一起，构成了一个路径
 */

@implementation PathDrawViewController

- (void) loadView
{
    self.view = [(PathDrawView *) [PathDrawView alloc] initWithFrame:[ViewManager mainWindowFrame]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
