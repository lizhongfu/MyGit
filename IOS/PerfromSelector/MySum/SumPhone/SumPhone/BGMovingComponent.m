//
//  BGMovingComponent.m
//  jm
//
//  Created by lee jory on 09-10-29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BGMovingComponent.h"


@implementation BGMovingComponent
@synthesize path;
-(CAAnimation*)animation {
    
    CAKeyframeAnimation* animation;
    animation = [CAKeyframeAnimation animation];
	animation.path = path;
	CGPathRelease(path);
	animation.duration = 26;
	animation.repeatCount = 10000;
 	animation.calculationMode = @"paced"; 	
	return animation;
}

-(CAAnimation*)fadeInOutAnimation{
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	animation.duration = 7;
	animation.repeatCount =10000;
	animation.toValue = [NSNumber numberWithFloat:.1];
	animation.autoreverses = YES;
	return animation;
}

-(void)startMoving{
	 
	
    [self.layer addAnimation:[self animation] forKey:@"position"];
	[self.layer addAnimation:[self fadeInOutAnimation] forKey:@"opacity"];
	
	self.layer.needsDisplayOnBoundsChange = YES;
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	self.layer.position = CGPointMake(100, 100);
	self.layer.opacity = .4;
}

- (void) dealloc
{
	CGPathRelease(path);

	[super dealloc];
}


-(void)initPath{
	path = CGPathCreateMutable();
	int udCount = 5;
	int width = self.frame.size.width / udCount ; 
	int xOffset = 150;
	int yOffset = 200;
	int waveHeight = 50;
	CGPoint p1 = CGPointMake(width * -1 + xOffset, self.frame.origin.y + yOffset);
	CGPoint p2 = CGPointMake(width * 0 + xOffset, self.frame.origin.y + yOffset);
	CGPoint p3 = CGPointMake(width * 1 + xOffset, self.frame.origin.y + yOffset);
	CGPoint p4 = CGPointMake(width * 2 + xOffset, self.frame.origin.y + yOffset);
	CGPoint p5 = CGPointMake(width * 3 + xOffset, self.frame.origin.y + yOffset); 
	CGPoint p6 = CGPointMake(width * 4 + xOffset, self.frame.origin.y + yOffset); 
	CGPoint p7 = CGPointMake(width * 5 + xOffset, self.frame.origin.y + yOffset); 
	CGPoint p8 = CGPointMake(width * 7 + xOffset, self.frame.origin.y + yOffset); 
	
	 
	CGPathMoveToPoint(path, NULL, p1.x,p1.y);

	CGPathAddQuadCurveToPoint(path, NULL, p1.x+width/2, p1.y - waveHeight, p2.x, p2.y);
	CGPathAddQuadCurveToPoint(path, NULL, p2.x+width/2, p2.y + waveHeight, p3.x, p3.y);
	CGPathAddQuadCurveToPoint(path, NULL, p3.x+width/2, p3.y - waveHeight, p4.x, p4.y);
	CGPathAddQuadCurveToPoint(path, NULL, p4.x+width/2, p4.y + waveHeight, p5.x, p5.y);
	CGPathAddQuadCurveToPoint(path, NULL, p5.x+width/2, p5.y - waveHeight, p6.x, p6.y);
	CGPathAddQuadCurveToPoint(path, NULL, p6.x+width/2, p6.y + waveHeight, p7.x, p7.y);
	CGPathAddQuadCurveToPoint(path, NULL, p7.x+width/2, p7.y - waveHeight, p8.x, p8.y);


}

- (id)initWithFrame:(CGRect)aRect{
	self = [super initWithFrame:aRect];
	if(self != nil){
		[self initPath];

		imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 165, 82)];
		imgView.image = [UIImage imageNamed:@"cloud.png"];
		imgView.opaque = NO;
 		[self addSubview:imgView];
		[self startMoving];
		[imgView release];
		
	}
	return self;
}

@end
