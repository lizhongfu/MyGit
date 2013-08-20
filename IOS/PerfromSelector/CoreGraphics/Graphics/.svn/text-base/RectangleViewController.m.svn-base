//
//  RectangleViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-13.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RectangleViewController.h"

@interface RectangleView : UIView

@end 

@implementation RectangleView

- (void) drawRect:(CGRect)rect
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rectangle = CGRectMake(10, 10, 200, 200);
    
//    把矩形添加到当前的路径中
    CGPathAddRect(path, NULL, rectangle);
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(currentContext, path);
    
    [[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1.0] setFill];
    
    [[UIColor brownColor] setStroke];
    
    CGContextSetLineWidth(currentContext, 5.0);
    
    CGContextDrawPath(currentContext, kCGPathEOFillStroke);
    
    CGPathRelease(path);
}

@end

@implementation RectangleViewController

- (void) loadView
{
    self.view = [RectangleView new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.frame = [ViewManager mainWindowFrame];
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
