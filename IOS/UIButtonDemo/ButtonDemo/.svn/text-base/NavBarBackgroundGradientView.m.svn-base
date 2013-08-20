//
//  NavBarBackgroundGradientView.m
//  CG Test
//
//  Created by jeff on 5/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NavBarBackgroundGradientView.h"


@implementation NavBarBackgroundGradientView

- (void)drawRect:(CGRect)rect 
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
	CGPathAddRect(path, NULL, rect);
    
	NSMutableArray *colors = [NSMutableArray arrayWithCapacity:5];
    UIColor *color;
	color = [UIColor colorWithRed:0.351 green:0.444 blue:0.573 alpha:1.0];
	[colors addObject:(id)[color CGColor]];
    
    CGFloat locations[5];
	locations[0] = 0.0;
    locations[1] = 1.0;
    locations[2] = 0.743;
    locations[3] = 0.498;
    locations[4] = 0.465;
    
	color = [UIColor colorWithRed:0.62 green:0.676 blue:0.754 alpha:1.0];
	[colors addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.563 green:0.627 blue:0.713 alpha:1.0];
	[colors addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.479 green:0.553 blue:0.66 alpha:1.0];
	[colors addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.43 green:0.51 blue:0.63 alpha:1.0];
	[colors addObject:(id)[color CGColor]];
	
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
	CGGradientRef gradient = CGGradientCreateWithColors(space, (CFArrayRef)colors, locations);
	CGContextAddPath(context, path);
	CGContextSaveGState(context);
	CGContextEOClip(context);
	CGPoint point = CGPointMake(100.0, self.bounds.size.height);
	CGPoint point2 = CGPointMake(100.0, 0.0);
	CGContextDrawLinearGradient(context, gradient, point, point2, (kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation));
	CGContextRestoreGState(context);
	CGGradientRelease(gradient);
	CGPathRelease(path);
	CGColorSpaceRelease(space);
}
@end
