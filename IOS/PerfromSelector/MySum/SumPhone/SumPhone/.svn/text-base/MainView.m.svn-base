//
//  MainView.m
//  Button Cluster
//
//  Created by tin on 10-3-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"


@implementation MainView



// Returns the center point for for the demonstration of the radial gradient
CGPoint demoRGCenter(CGRect bounds)
{
	return CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds)-60);
}

// Returns an appropriate inner radius for the demonstration of the radial gradient
CGFloat demoRGInnerRadius(CGRect bounds)
{
	CGFloat r = bounds.size.width < bounds.size.height ? bounds.size.width : bounds.size.height;
	return r * 0.125;
}

// Returns an appropriate outer radius for the demonstration of the radial gradient
CGFloat demoRGOuterRadius(CGRect bounds)
{
	CGFloat r = bounds.size.width < bounds.size.height ? bounds.size.width : bounds.size.height;
	return r * 0.86;
}




- (id)init{
    if (self = [super initWithFrame:BaseFrame]) {
        // Initialization code
    }
    return self;
}




- (void)drawRect:(CGRect)rect {
    // Drawing code
	
	
	//set gradient color
	CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
//	CGFloat colors[] =
//	{
//		46 / 255.0, 51 / 255.0, 61 / 255.0, 1.00,
//		8 / 255.0,  13 / 255.0, 23 / 255.0, 1.00,
//	};
    
    CGFloat colors[] =
	{
		255.0 / 255.0, 0 / 255.0, 0 / 255.0, 1.00,
        0 / 255.0, 0 / 255.0,  255.0/ 255.0, 1.00,
        255.0 / 255.0, 255.0 / 255.0, 0/ 255.0, 1.00,
        
	};
	
	CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
	CGColorSpaceRelease(rgb);
	
	
	
	// The clipping rects we plan to use, which also defines the location and span of each gradient
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGRect clip=[self bounds];
	
	CGPoint start, end;
	CGFloat startRadius, endRadius;
	
	// Clip to area to draw the gradient, and draw it. Since we are clipping, we save the graphics state
	
	
	CGContextClipToRect(context, clip);
	start = end = demoRGCenter(clip);
	startRadius = demoRGInnerRadius(clip);
	endRadius = demoRGOuterRadius(clip);
    
	CGContextDrawRadialGradient(context, gradient, start, startRadius, end, endRadius, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
	
	
	CGGradientRelease(gradient);

	
	
}



- (void)dealloc {
    [super dealloc];
}


@end
