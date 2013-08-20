//
//  UITextViewDemoViewController.m
//  UITextViewDemo
//
//  Created by Zogful Lee on 11-9-16.
//  Copyright 2011 sina. All rights reserved.
//

#import "UITextViewDemoViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation UITextViewDemoViewController
@synthesize myTextView;

+ (NSString *)friendlyName {
    return @"UITextView自己的Demo";
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if ([text isEqualToString:@"\n"]) {
		[myTextView resignFirstResponder];
		return NO;
	}
	
	if (range.location > 5) {
		
		NSLog(@"text:%@",text );
		NSLog(@"textView.text:%@", textView.text);
		return NO;
	}
	else {
	
	}

	return YES;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = BaseFrame;
	
	myTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, 300, 350)];
	myTextView.delegate = self;
	myTextView.text = @"";
	myTextView.backgroundColor = [UIColor whiteColor];
	myTextView.textColor = [UIColor redColor];
	myTextView.textAlignment = UITextAlignmentLeft;
	myTextView.font = [UIFont boldSystemFontOfSize:20];
    
    myTextView.layer.cornerRadius=10;
    myTextView.layer.masksToBounds=YES;
    myTextView.layer.borderColor=[UIColor colorWithRed:0xD0/255.0 green:0xD0/255.0 blue:0xD0/255.0 alpha:1].CGColor;
    myTextView.layer.borderWidth=1.0;
    myTextView.layer.contents = (id)[UIImage imageNamed:@"MAC56 (18).jpg"].CGImage;
//	BOOL isEditable = myTextView.editable;
//	isEditable;

    
    /////////添加输入框的键盘自定义
    UIView *view = [[UIView alloc] init];
    [view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bottonBG.png"]]];
    [view setAlpha:0.9];
    UIButton *Done_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Done_btn addTarget:self action:@selector(hideKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
    [Done_btn setBackgroundImage:[UIImage imageNamed:@"bg.png"] forState:UIControlStateNormal];
    [Done_btn setTitleColor:[UIColor scrollViewTexturedBackgroundColor] forState:UIControlStateNormal];
    [Done_btn setTitle:@"完成" forState:UIControlStateNormal];
    Done_btn.titleLabel.font=[UIFont systemFontOfSize:12.0];
    [Done_btn setFrame:CGRectMake(270, 5, 43, 29)];
    view.frame = CGRectMake(0, 0, 320, 44);
    [view addSubview:Done_btn];
    
//    在弹出的键盘上加一个view
    myTextView.inputAccessoryView = view;
    
//    可以把键盘换成一个view弹出
    myTextView.inputView = view;
    
    [view release];
	
	[self.view addSubview:myTextView];
	
		//listen for ketboard
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)hideKeyBoard:(id)sender
{
    [myTextView  resignFirstResponder];
}

- (void) keyboardWillShow:(NSNotificationCenter *) notification {
	NSDictionary *userInfo = [notification userInfo];
	CGRect bounds;
	[(NSValue *)[userInfo objectForKey:UIKeyboardBoundsUserInfoKey] getValue:&bounds];
	
		//Resize the view
	CGRect aFrame = myTextView.frame;
	aFrame.size.height -= bounds.size.height;
	myTextView.frame = aFrame;
}

- (void) keyboardWillHide:(NSNotificationCenter *) notification {
	NSDictionary *userInfo = [notification userInfo];
	CGRect bounds;
	[(NSValue *)[userInfo objectForKey:UIKeyboardBoundsUserInfoKey] getValue:&bounds];
	
		//Resize the view
	CGRect aFrame = myTextView.frame;
	aFrame.size.height += bounds.size.height;
	myTextView.frame = aFrame;
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
    [super dealloc];
	
	[myTextView release];
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
