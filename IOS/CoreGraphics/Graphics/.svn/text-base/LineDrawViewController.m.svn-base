//
//  LineDrawViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-13.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "LineDrawViewController.h"

@interface LineDrawView : UIView

@end

@implementation LineDrawView

- (void) drawRect:(CGRect)rect
{
//     为图形上下文选择一个颜色（设置线条的颜色）
    [[UIColor brownColor] set];
    
//    获取当前图形上下文句柄
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
//    设置两条线的连接样式
    CGContextSetLineJoin(currentContext, kCGLineJoinRound);
    
//    设置线宽，此线宽用逻辑点度量，省去开发者自己去计算各机型像素差异
    CGContextSetLineWidth(currentContext, 10.0f);
    
//    设置线的起点
    CGContextMoveToPoint(currentContext, 50.0f, 10.0f);
    
//    设置线的终点
    CGContextAddLineToPoint(currentContext, 100.0f, 200.0f);
    
//    另一个点
    CGContextAddLineToPoint(currentContext, 150.0f, 200.0f);
    
//    创建已设定好的路径，用图形上下文的当前颜色去绘制线条
    CGContextStrokePath(currentContext);
    
    [[UIColor whiteColor] set];
    
    NSString *aStr = @"TEST";
    [aStr drawAtPoint:CGPointMake(200, 200) withFont:[UIFont boldSystemFontOfSize:30]];
}

@end

@implementation LineDrawViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view = [(LineDrawView *) [LineDrawView alloc] initWithFrame:[ViewManager mainWindowFrame]];
}

@end
