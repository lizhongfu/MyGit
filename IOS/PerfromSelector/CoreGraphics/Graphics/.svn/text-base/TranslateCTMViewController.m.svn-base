//
//  TranslateCTMViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-14.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "TranslateCTMViewController.h"

@interface TranslateCTMView : UIView

@end

@implementation TranslateCTMView

- (void) drawRect:(CGRect)rect
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rectangle = CGRectMake(10, 10, 200, 300);
    
    CGPathAddRect(path, NULL, rectangle);
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(currentContext);
    
    CGContextTranslateCTM(currentContext, 100, 0);
    
    CGContextAddPath(currentContext, path);
    
    [[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1.0] setFill];
    [[UIColor brownColor] setStroke];
    
    CGContextSetLineWidth(currentContext, 5.0);
    
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    CGPathRelease(path);
    
    CGContextRestoreGState(currentContext);
}

@end

@implementation TranslateCTMViewController

- (void) loadView
{
    self.view = [TranslateCTMView new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.frame = [ViewManager mainWindowFrame];
}


@end
