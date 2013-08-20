//
//  CustomToolBar.m
//  test
//
//  Created by J Dinosaure on 11-5-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomToolBar.h"

#define radius 10.0
#define width self.frame.size.width
#define height self.frame.size.height

@implementation CustomToolBar


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setBackgroundColor:[UIColor clearColor]];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
    
    UIColor *fillColor = [self tintColor];
    
    if (fillColor == nil) {
        fillColor = [UIColor blueColor];
    }
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0.0, height);
    CGPathAddLineToPoint(path, NULL, 0.0, radius);
    CGPathAddQuadCurveToPoint(path, NULL, 0.0, 0.0, radius, 0.0);
    CGPathAddLineToPoint(path, NULL, width - radius, 0.0);
    CGPathAddQuadCurveToPoint(path, NULL, width, 0.0, width, radius);
    CGPathAddLineToPoint(path, NULL, width, height);
    CGPathCloseSubpath(path);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddPath(ctx, path);
    CGContextClip(ctx);
    CGPathRelease(path);
    
    
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    CGContextAddRect(ctx, CGRectMake(0.0, 0.0, width, height));
    CGContextDrawPath(ctx, kCGPathFill);
    
    CGFloat location[] = {
      0.0,1.0  
    };
    CGFloat compants[] = {
      1.0,1.0,1.0,0.4,// start
      1.0,1.0,1.0,0.8//end
    };
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, compants, location, 2);
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0.0, height * 0.5 + 1.0), CGPointZero, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


- (void)dealloc {
    [super dealloc];
}


@end
