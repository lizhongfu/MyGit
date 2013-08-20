//
//  RotationViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-14.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationView : UIView

@end

@implementation RotationView

- (void) drawRect:(CGRect)rect
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rectangle = CGRectMake(10, 10, 200, 300);
    
    CGPathAddRect(path, NULL, rectangle);
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(currentContext);
    
    CGContextRotateCTM(currentContext, (45.0f * M_PI)/180.0f);
    
    CGContextAddPath(currentContext, path);
    
    [[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1.0] setFill];
    [[UIColor brownColor] setStroke];
    
    CGPathRelease(path);
    
    CGContextRestoreGState(currentContext);
    
    //    other
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    CGRect rectangle1 = CGRectMake(310, 10, 200, 300);
    
    CGAffineTransform transform = CGAffineTransformMakeRotation((45.0f * M_PI)/180.0f);
    
    CGPathAddRect(path1, &transform, rectangle1);
    
    CGContextAddPath(currentContext, path1);
    
    [[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1.0] setFill];
    [[UIColor brownColor] setStroke];
    
    CGContextSetLineWidth(currentContext, 5.0);
    
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    CGPathRelease(path1);
}

@end

@implementation RotationViewController

- (void) loadView
{
    self.view = [RotationView new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.frame = [ViewManager mainWindowFrame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
