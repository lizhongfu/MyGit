//
//  ShapesViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-15.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ShapesViewController.h"

@interface ShapesView : UIView

@end

@implementation ShapesView

//CG_EXTERN void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y,
//                               CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)

- (void) drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] setStroke];
    [[UIColor purpleColor] setFill];
    CGContextSetLineWidth(context, 5.0);
    CGContextMoveToPoint(context, 50, 100);
    CGContextAddLineToPoint(context, 200, 100);
    CGContextStrokePath(context);
    CGContextAddEllipseInRect(context, CGRectMake(70, 170, 50, 50));
    CGContextStrokePath(context);
    CGContextAddEllipseInRect(context, CGRectMake(150, 170, 50, 50));
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1);
    CGContextSetRGBFillColor(context, 0, 0, 1, 1);
    CGContextAddRect(context, CGRectMake(30, 30, 60, 60));
    CGContextFillPath(context);
    
    CGContextAddArc(context, 260, 90, 40, 0*M_PI/180, 270*M_PI/180.0, 1);
    CGContextAddLineToPoint(context, 280, 350);
    
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, 130, 300);
    CGContextAddLineToPoint(context, 80, 250);
    CGContextAddLineToPoint(context, 190, 250);
    CGContextAddLineToPoint(context, 130, 300);
    
    CGContextMoveToPoint(context, 0, 336);
    CGContextAddArc(context, 160, 80, 300, -180*M_PI/180, 0*M_PI/180.0, 1);
    
    CGContextStrokePath(context);
}

@end

@implementation ShapesViewController

- (void) loadView
{
    self.view = [[ShapesView new] autorelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];
}

@end
