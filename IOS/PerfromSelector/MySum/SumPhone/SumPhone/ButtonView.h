//
//  ButtonView.h
//  Button Cluster
//
//  Created by tin on 10-3-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface ButtonView : UIView {
	
	float z;
	CGPoint oldPosition;
	CGAffineTransform oldTransform;
	float oldAlpha;
	NSString *ID;

	
	
}

@property(readwrite)float z;
@property(readwrite)CGPoint oldPosition;
@property(readwrite)CGAffineTransform oldTransform;
@property(readwrite)float oldAlpha;

- (id)initWithID: (NSString*)ID;
-(void)moveToX:(float)_x Y:(float)_y;
-(void)scale:(float)scaleValue;

@end

