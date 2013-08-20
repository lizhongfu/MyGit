//
//  GrowingTextViewViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GrowingTextViewViewController.h"

@interface GrowingTextViewViewController ()

@end

@implementation GrowingTextViewViewController

+ (NSString *)friendlyName {
    return @"UITextView自适应内容高度";
}

-(id)init
{
	self = [super init];
	if(self){
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(keyboardWillShow:) 
													 name:UIKeyboardWillShowNotification 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(keyboardWillHide:) 
													 name:UIKeyboardWillHideNotification 
												   object:nil];		
	}
	
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.frame = BaseFrame;
    
    textView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
	textView.minNumberOfLines = 1;
	textView.maxNumberOfLines = 4;
	textView.returnKeyType = UIReturnKeyGo; //just as an example
	textView.font = [UIFont boldSystemFontOfSize:15.0f];
	textView.delegate = self;
	//textView.animateHeightChange = NO; //turns off animation
    textView.backgroundColor = [UIColor redColor];
	[self.view addSubview:textView];
	[textView sizeToFit];
	
	UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	doneBtn.frame = CGRectMake(30, 30, 260, 80);
	[doneBtn setTitle:@"Done" forState:UIControlStateNormal];
	[doneBtn addTarget:self action:@selector(resignTextView) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:doneBtn];
    
	CGRect r = textView.frame;
	r.origin.y = self.view.frame.size.height - r.size.height;
    textView.frame = r;
}

-(void)resignTextView
{
	[textView resignFirstResponder];
}

//Code from Brett Schumann
-(void) keyboardWillShow:(NSNotification *)note{
    // get keyboard size and loctaion
	CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardBoundsUserInfoKey] getValue: &keyboardBounds];
	
	// get the height since this is the main value that we need.
	NSInteger kbSizeH = keyboardBounds.size.height;
    
	// get a rect for the textView frame
	CGRect textViewFrame = textView.frame;
	textViewFrame.origin.y -= kbSizeH;
	
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
	
	// set views with new info
	textView.frame = textViewFrame;
	
	// commit animations
	[UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note{
    // get keyboard size and location
	CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardBoundsUserInfoKey] getValue: &keyboardBounds];
	
	// get the height since this is the main value that we need.
	NSInteger kbSizeH = keyboardBounds.size.height;
	
	// get a rect for the textView frame
	CGRect textViewFrame = textView.frame;
	textViewFrame.origin.y += kbSizeH;
	
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
	
	// set views with new info
	textView.frame = textViewFrame;
	
	// commit animations
	[UIView commitAnimations];
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
	float diff = (textView.frame.size.height - height);
    
	CGRect r = textView.frame;
	r.origin.y += diff;
	textView.frame = r;
}

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
	[textView release];
    [super dealloc];
}

@end
