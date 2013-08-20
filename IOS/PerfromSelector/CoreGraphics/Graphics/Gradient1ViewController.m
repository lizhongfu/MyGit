//
//  Gradient1ViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-14.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "Gradient1ViewController.h"

@interface Gradient1View : UIView

@end

@implementation Gradient1View

- (void) drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(currentContext);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    UIColor *startColor = [UIColor orangeColor];
    CGFloat *startColorComponents = (CGFloat *)CGColorGetComponents([startColor CGColor]);
    UIColor *endColor = [UIColor blueColor];
    CGFloat *endColorComponents = (CGFloat *)CGColorGetComponents([endColor CGColor]);
    
    CGFloat colorComponents[8] =
    {
        startColorComponents[0],
        startColorComponents[1],
        startColorComponents[2],
        startColorComponents[3],
        
        endColorComponents[0],
        endColorComponents[1],
        endColorComponents[2],
        endColorComponents[3]
    };
    
    CGFloat colorIndices[2] =
    {
        0.0f,
        1.0f
    };
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace,
                                        (const CGFloat *)&colorComponents,
                                        (const CGFloat *)&colorIndices,
                                        2);
    
    CGColorSpaceRelease(colorSpace);
    
    CGPoint startPoint, endPoint;
    startPoint = CGPointMake(120, 260);
    endPoint = CGPointMake(200, 220);
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
    CGContextRestoreGState(currentContext);
}

@end

@implementation Gradient1ViewController

- (void) loadView
{
    self.view = [Gradient1View new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.frame = [ViewManager mainWindowFrame];
}

@end
