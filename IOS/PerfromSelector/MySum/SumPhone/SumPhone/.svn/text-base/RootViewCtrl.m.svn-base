//
//  RootViewCtrl.m
//  opacityAnimationTest
//
//  Created by iori on 09/07/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RootViewCtrl.h"
#import <QuartzCore/QuartzCore.h>

@implementation RootViewCtrl

+ (NSString *)friendlyName {
    return @"动态放4个Label";
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    UIButton *btShow = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btShow.frame = CGRectMake(43, 280, 72, 37);
    [btShow setTitle:@"Show" forState:UIControlStateNormal];
    [btShow addTarget:self action:@selector(showAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btShow];
    
    UIButton *btHide = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btHide.frame = CGRectMake(194, 280, 72, 37);
    [btHide setTitle:@"Hide" forState:UIControlStateNormal];
    [btShow addTarget:self action:@selector(hideAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btHide];
	
	float xOffset = labelXOffset;
	for(int i=0; i<4; i++)
	{
		labels[i] = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, labelYOffset, labelWidth, labelHeight)];
		labels[i].textAlignment = UITextAlignmentCenter;
		labels[i].text = [NSString stringWithFormat:@"Test %d",i];
		labels[i].tag = LabelTag+i;
		labels[i].backgroundColor = [UIColor blueColor];
		[self.view addSubview:labels[i]];
		xOffset += labelWidth+15;
	}
	hiding = NO;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (CAAnimationGroup*) createAnimitonGroup:(CATransform3D)transform opacity:(float)opacity
{
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
	animation.duration = 0.5;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	[animation setFillMode:kCAFillModeForwards];
	animation.removedOnCompletion = NO;
	animation.toValue = [NSValue valueWithCATransform3D:transform];
	
	CABasicAnimation *dispearAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
	dispearAnim.duration = 0.5;
	[dispearAnim setFillMode:kCAFillModeForwards];
	dispearAnim.removedOnCompletion = NO;
	dispearAnim.toValue = [NSNumber numberWithFloat:opacity];
	
	CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
	animationGroup.delegate = self;
	animationGroup.duration = 1.0;
	animationGroup.removedOnCompletion = NO;
	[animationGroup setFillMode:kCAFillModeForwards];
	animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	animationGroup.animations = [NSArray arrayWithObjects:animation,dispearAnim,nil];	
	return animationGroup;
}

- (void)hideViews:(NSTimer *)timer {
	
	UILabel *label = (UILabel *)[timer userInfo];
	label.transform = CGAffineTransformIdentity;
	label.alpha = 1.0;
//#ifdef UIViewAnimation	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	label.alpha = 0;
	label.transform = CGAffineTransformTranslate(CGAffineTransformMakeScale(3, 3), -10, -20);
	[UIView commitAnimations];
	
//#else
//	CAAnimationGroup *group = [self createAnimitonGroup:CATransform3DTranslate(CATransform3DMakeScale(3, 3, 1), -10, -20, 0.0) opacity:0.0];
//	[label.layer addAnimation:group forKey:@"ViewAnimations"];
//#endif
}

- (void)showView:(NSTimer *)timer {

	UILabel *label = (UILabel *)[timer userInfo];
	label.transform = CGAffineTransformTranslate(CGAffineTransformMakeScale(3, 3), -10, -20);
	label.alpha = 0.0;
//#ifdef UIViewAnimation	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	label.alpha = 1;
	label.transform = CGAffineTransformTranslate(CGAffineTransformMakeScale(1, 1), 0, 0);
	[UIView commitAnimations];
//#else
//	CAAnimationGroup *group = [self createAnimitonGroup:CATransform3DTranslate(CATransform3DMakeScale(1, 1, 1), 0.0, 0.0, 0.0) opacity:1.0];
//	[label.layer addAnimation:group forKey:@"ViewAnimations"];
//#endif
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag 
{
}

-(void) showAction
{
	hiding = NO;
	for(int i=1; i<=4; i++)
	{
		[NSTimer scheduledTimerWithTimeInterval:1.1*i target:self selector:@selector(showView:) userInfo:labels[i-1] repeats:NO];
	}
}

-(void) hideAction
{
	hiding = YES;
	for(int i=4; i>=1; i--)
	{
		[NSTimer scheduledTimerWithTimeInterval:1.1*(5-i) target:self selector:@selector(hideViews:) userInfo:labels[i-1] repeats:NO];
	}
}

@end
