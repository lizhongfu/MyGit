//
//  GradientViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-14.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "GradientViewController.h"

@interface GradientView : UIView

@end

@implementation GradientView

- (void) drawRect:(CGRect)rect
{
//    色彩空间，需要释放
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
//    组成颜色对象的各个分量，是一个数组，如果这里不明白可以参考 ColorViewController.m
    UIColor *startColor = [UIColor blueColor];
    CGFloat *startColorComponents = (CGFloat *)CGColorGetComponents([startColor CGColor]); //指针数组
    
    UIColor *midColor = [UIColor brownColor];
    CGFloat *midColorComponents = (CGFloat *)CGColorGetComponents([midColor CGColor]); //指针数组
    
    UIColor *endColor = [UIColor greenColor];
    CGFloat *endColorComponents = (CGFloat *)CGColorGetComponents([endColor CGColor]); //指针数组
    
//    获取每种颜色的分量之后，把它们放入一个扁平数组传递到XX
    CGFloat colorComponents[12] =
    {
        startColorComponents[0],
        startColorComponents[1],
        startColorComponents[2],
        startColorComponents[3],
        
        midColorComponents[0],
        midColorComponents[1],
        midColorComponents[2],
        midColorComponents[3],
        
        endColorComponents[0],
        endColorComponents[1],
        endColorComponents[2],
        endColorComponents[3]
    };
    
//    指出渐变最开始的位置和结束位置，数组中只有两种颜色
    CGFloat colorIndices[3] =
    {
        0.0f,
        0.5f,
        1.0f
    };
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace,
                                                                 (const CGFloat *)&colorComponents,
                                                                 (const CGFloat *)&colorIndices,
                                                                 3);
    
//    释放色彩空间
    CGColorSpaceRelease(colorSpace);
    
//    获取当前图形上下文
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGRect screenBounds = [ViewManager mainWindowFrame];
    
    CGPoint startPoint, endPoint;
//    startPoint = CGPointMake(0.0f, screenBounds.size.height/2.0f);
//    endPoint = CGPointMake(screenBounds.size.width, startPoint.y);

    startPoint = CGPointMake(0.0f, 0.0f);
    endPoint = CGPointMake(screenBounds.size.width, screenBounds.size.height);
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    
//    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
}

@end

@implementation GradientViewController

- (void) loadView
{
    self.view = [GradientView new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.frame = [ViewManager mainWindowFrame];
//    self.view.backgroundColor = [UIColor whiteColor];
}

@end
