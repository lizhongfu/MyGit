//
//  MainViewController.m
//  Button Cluster
//
//  Created by tin on 10-3-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "ButtonView.h"

#define Max_Button_Num 1

static int moveCount;

static float dx;
static float dy;

static id touchButton;
static id mainView;
static bool hasFocusButton;
static bool isMoving;

static SystemSoundID moveSound;
static SystemSoundID touchSound;
static SystemSoundID showSound;




@implementation MainViewController


+ (NSString *)friendlyName {
    return @"一串按钮";
}


+(void)focusButton:(id)bt{
    
#if OUTPUT_CoreGraphics_MainViewController
    kPrintInfo;
#endif
	
	if(!hasFocusButton){
    
		
		AudioServicesPlaySystemSound (moveSound);
		
		
		touchButton=bt;
		
		
		//record the focus button's properties.
		[touchButton setOldPosition:[touchButton center]];
		[touchButton setOldTransform:[touchButton transform]];  
		[touchButton setOldAlpha:[touchButton alpha]]; 
		

		
		
		[UIView beginAnimations:@"focusButton" context:nil];
		[UIView setAnimationDuration:1];
		
		//scale the touched button to 250%.
		[touchButton setTransform:CGAffineTransformScale(CGAffineTransformIdentity,2.5,2.5)];
		
		[touchButton setCenter:CGPointMake(160, 240)];
		[touchButton setAlpha:1];
		
		[mainView bringSubviewToFront:touchButton];
		

		//scale down other buttons.
		for (ButtonView *bt in [mainView subviews]) {
			
			if(bt!=touchButton){
					
				[bt scale:0.4];
				
				
			}
			
		}
		
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(sayHello)];
		[UIView commitAnimations];
		
		
	}
//        else{
//        
//		
//		AudioServicesPlaySystemSound (touchSound);
//		
//		
//		[UIView beginAnimations:@"unFocusButton" context:nil];
//		[UIView setAnimationDuration:1];
//		
//			
//		//to resume the focus button's properties.
//		[touchButton setTransform:[touchButton oldTransform]];
//		[touchButton setCenter:[touchButton oldPosition]];
//		[touchButton setAlpha:[touchButton oldAlpha]];
//		
//		//to resume the other button's size.
//		for (ButtonView *bt in [mainView subviews]) {
//			
//			if(bt!=touchButton){
//				
//				
//				[bt scale:1/0.4];
//				
//				
//			}
//			
//		}
//		
//		[UIView commitAnimations];
//		
//	}

	hasFocusButton=!hasFocusButton;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	mainView = [[MainView alloc] init];
	[self setView:mainView];
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
	self.view.frame = BaseFrame;
	
	
	for (int i=0; i< Max_Button_Num; i++) {
		
		ButtonView *bt=[[ButtonView alloc]initWithID:[NSString stringWithFormat: @"%i",i]];
		
		int rx=random()%320;
		int ry=random()%480;
		int rz=random()%320;
		
		bt.alpha=rz/320.0f;
		bt.center=CGPointMake(rx, ry);
		bt.z=rz;
		
		[self scale:rz/320.0f theView:bt];
		[mainView addSubview:bt];
		[bt release];
		
		
	}
	
	
	hasFocusButton=NO;
	
	[self initSound];
	
}

-(void)scale:(float)scaleValue theView:(UIView *)view{
#if OUTPUT_CoreGraphics_MainViewController
    kPrintInfo;
#endif
	CGAffineTransform transform=view.transform;
	transform=CGAffineTransformScale(transform, scaleValue, scaleValue);
	view.transform=transform;	
	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{	
#if OUTPUT_CoreGraphics_MainViewController
    kPrintInfo;
#endif
	
	UITouch *touch = touches.anyObject; 
	touchPoint =[touch locationInView:mainView]; 
	
	
	//if(!hasFocusButton)[self playSound:touchSound];
	
	
	isMoving=NO;

}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event { 
#if OUTPUT_CoreGraphics_MainViewController
    kPrintInfo;
#endif
	
	
	if(!isMoving & !hasFocusButton)AudioServicesPlaySystemSound(moveSound);
	isMoving=YES;
	
	
	
	UITouch *touch = touches.anyObject; 
	movePoint =[touch locationInView:mainView]; 
	
	
	
	if(moveCount<5){
		moveCount++;
		
	}else{
		moveCount=0;
		
		touchPoint.x=movePoint.x;
		touchPoint.y=movePoint.y;
		
	}
	
	
	dx=movePoint.x-touchPoint.x;
	dy=movePoint.y-touchPoint.y;
	
	
	
	for (ButtonView *bt in [mainView subviews]) {
		
		[bt moveToX:dx Y:dy];	
		
	}
	
	
	

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { 
#if OUTPUT_CoreGraphics_MainViewController
    kPrintInfo;
#endif
    
	moveCount=0;
	//dx=0;
	//dy=0;
	
	[UIView beginAnimations:@"move" context:nil];
	[UIView setAnimationDuration:1];
	

	if(hasFocusButton){;
		
		// if there is a focus button in center, unfocus it first 
		
		for (ButtonView *bt in [mainView subviews]) {
			
			[bt moveToX:dx Y:dy];
			
			
			if(bt==touchButton){
//				在这里还原按钮大小的
				[bt setTransform:[touchButton oldTransform]];
				[bt setCenter:[touchButton oldPosition]];
				[bt setAlpha:[touchButton oldAlpha]];
				
			}else{
				
				[bt scale:1/0.4];
				
			}
			
			
		}
		
		hasFocusButton=NO;
		
		AudioServicesPlaySystemSound(touchSound);
		
	}else{
		
		// if there has no focus button , just to move buttons slightly.
		
		for (ButtonView *bt in [mainView subviews]) {
			
			[bt moveToX:dx Y:dy];
			
			
		}
		
	}

	[UIView commitAnimations];
	

}

- (void)initSound{
	
	NSString *path ;
	
	path= [[NSBundle mainBundle] pathForResource:@"touch" ofType:@"caf"]; // button
	AudioServicesCreateSystemSoundID ((CFURLRef)[NSURL fileURLWithPath:path],&touchSound);
	
	path = [[NSBundle mainBundle] pathForResource:@"move" ofType:@"caf"]; // button
	AudioServicesCreateSystemSoundID ((CFURLRef)[NSURL fileURLWithPath:path],&moveSound);
	
	path = [[NSBundle mainBundle] pathForResource:@"show" ofType:@"caf"]; // button
	AudioServicesCreateSystemSoundID ((CFURLRef)[NSURL fileURLWithPath:path], &showSound);

}

+(void)sayHello{
#if OUTPUT_CoreGraphics_MainViewController
    kPrintInfo;
#endif
    
	AudioServicesPlaySystemSound(showSound);
}

- (void)dealloc {
	
	AudioServicesDisposeSystemSoundID (touchSound);
	AudioServicesDisposeSystemSoundID (moveSound);
	AudioServicesDisposeSystemSoundID (showSound);

	[mainView release];
    [super dealloc];
	
}


@end
