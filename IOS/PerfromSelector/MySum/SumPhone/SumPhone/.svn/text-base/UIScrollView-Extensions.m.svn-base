//
//  UIScrollView-Extensions.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIScrollView-Extensions.h"

@implementation UIScrollView (Touch_Extensions)

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (!self.dragging) {
		[[self nextResponder] touchesBegan:touches withEvent:event];
	}
	[super touchesBegan:touches withEvent:event];
	NSLog(@"myScrollView touchesBegan");
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if (!self.dragging) {
		[[self nextResponder] touchesMoved:touches withEvent:event];
	}
	[super touchesMoved:touches withEvent:event];
	NSLog(@"myScrollView touchesMoved");
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if (!self.dragging) {
		[[self nextResponder] touchesEnded:touches withEvent:event];
	}
	[super touchesEnded:touches withEvent:event];
	NSLog(@"myScrollView touchesEnded");
}//触摸结束事件被干掉了

@end
