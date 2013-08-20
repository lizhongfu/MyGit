//
//  UITextFieldDemoViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "UITextFieldDemoViewController.h"

#define ALPHA	@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
#define NUMBERS	@"0123456789"
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 "
#define NUMBERSPERIOD	@"0123456789."

@implementation UITextFieldDemoViewController
@synthesize myTextField;

+ (NSString *)friendlyName {
    return @"UITextField自己的Demo";
}

- (void) anotherMethodHoldKeyboard {
	UIToolbar *topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
	[topView setBarStyle:UIBarStyleBlack];
	
	UIBarButtonItem *helloButton = [[UIBarButtonItem alloc] initWithTitle:@"Hello" 
																	style:UIBarButtonItemStyleBordered 
																   target:self 
																   action:nil];
	
	UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace 
																			  target:self 
																			  action:nil];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" 
																   style:UIBarButtonItemStyleDone 
																  target:self 
																  action:@selector(dismissKeyBoard)];
	
	NSArray *buttonsArray = [NSArray arrayWithObjects:helloButton, btnSpace, doneButton, nil];
	
	[doneButton release];
	[btnSpace release];
	[helloButton release];
	
	[topView setItems:buttonsArray];
	
    //inputAccessoryView　是textField激活状态下，从地步弹出的一个View放到键盘上边
	[myTextField setInputAccessoryView:topView];
	
    //inputView　是textField激活状态下，从地步弹出的一个View
    //[myTextField setInputView:topView];
}

- (void) dismissKeyBoard {
	[myTextField resignFirstResponder];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    //frame
	myTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
	myTextField.center = CGPointMake(160, 50);
    //delegate
	myTextField.delegate = self;
    //keyboard 
	myTextField.autocorrectionType = UITextAutocorrectionTypeNo;//文本服从iphone的自动更新特征
	myTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    //myTextField.returnKeyType = UIReturnKeyDone;
	
	myTextField.enablesReturnKeyAutomatically = YES;//至少输入一个字符，返回键才被激活
	myTextField.keyboardType = UIKeyboardTypeDefault;
	myTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
    //myTextField.secureTextEntry = YES;
    //property
	myTextField.text = @"";
	myTextField.textColor = [UIColor redColor];
	myTextField.font = [UIFont boldSystemFontOfSize:16];
	myTextField.textAlignment = UITextAlignmentLeft;
	myTextField.borderStyle = UITextBorderStyleLine;
	myTextField.placeholder = @"Test";
	myTextField.clearsOnBeginEditing = NO;
	myTextField.adjustsFontSizeToFitWidth = YES;
	myTextField.minimumFontSize = 20.0f;
	myTextField.background = [[UIImage imageNamed:@"alert-view-ok-button.png"] stretchableImageWithLeftCapWidth:100 topCapHeight:30];
	myTextField.disabledBackground = [[UIImage imageNamed:@"alert-view-bg-portrait.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
	BOOL isEdited =  myTextField.editing;
	isEdited;
	myTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//设置清除按钮
	
    //myTextField.rightViewMode = UITextFieldViewModeAlways;
    //myTextField.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alert-view-bg-portrait.png"]];
	
	
	[self.view addSubview:myTextField];
	
	[self anotherMethodHoldKeyboard];
	
    //segment
	UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:[@"ABC 123 2.3 A2C" componentsSeparatedByString:@" "]];
	seg.center = CGPointMake(160, 100);
	seg.segmentedControlStyle = UISegmentedControlStyleBordered;
	seg.tag = 111;
	seg.selectedSegmentIndex = 0;
	[seg addTarget:self action:@selector(segAction) forControlEvents:UIControlEventValueChanged];
	
	[self.view addSubview:seg];
	[seg release];
}

- (void) segAction {
	myTextField.text = @"";
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
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	
}

#pragma mark UITextField delegate method
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
	[myTextField resignFirstResponder];
	//return YES;
	return NO;
}//此方法捕获所有Return键的动作，无论此键被如何命名


- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {

	return YES;// return NO to disallow editing.
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    // became first responder

	return;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end

	return YES;
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
	// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

	return;
}

#define MaxWritableNum 5
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	// return NO to not change text
	if ([string isEqualToString:@"\n"]) {
		[textField resignFirstResponder];
		return NO;
	}//当return不用时，输入回车隐藏键盘
	
    //set the text content style that can be input
	NSCharacterSet *cs;
	switch ([(UISegmentedControl *)[self.view viewWithTag:111] selectedSegmentIndex]) {
		case 0:
			cs = [[NSCharacterSet characterSetWithCharactersInString:ALPHA] invertedSet];
			break;
		case 1:
			cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
			break;
		case 2: {
			cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
			if ([textField.text rangeOfString:@"."].location == NSNotFound) {
				cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERSPERIOD] invertedSet];
			}
			break;
		}
		case 3:
			cs = [[NSCharacterSet characterSetWithCharactersInString:ALPHANUM] invertedSet];
			break;
		default:
			break;
	}
	
	NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
	BOOL basicTest = [string isEqualToString:filtered];
	
    //逻辑结合了一下
	if (range.location >= MaxWritableNum) {
		
		writableTextNum = 0;
		NSLog(@"writableTextNum is: %d", writableTextNum);
		return NO && basicTest;
	} else {
		int existTextNum = [myTextField.text length];
		writableTextNum = MaxWritableNum - existTextNum;
		
		NSLog(@"writableTextNum is: %d", writableTextNum);
		
		return YES && basicTest;
	}//限制最多可以输入５个字母，并计算剩余可以输入的字数
    
	
	return YES;
}

- (BOOL) textFieldShouldClear:(UITextField *)textField {
	if (writableTextNum != 0) {
		return NO;
	} else {
		return YES;
	}
}//限制输入５个数之后才允许取消

// drawing and positioning overrides

//- (CGRect)borderRectForBounds:(CGRect)bounds;
//- (CGRect)textRectForBounds:(CGRect)bounds;
//- (CGRect)placeholderRectForBounds:(CGRect)bounds;
//- (CGRect)editingRectForBounds:(CGRect)bounds;
//- (CGRect)clearButtonRectForBounds:(CGRect)bounds;
//- (CGRect)leftViewRectForBounds:(CGRect)bounds;
//- (CGRect)rightViewRectForBounds:(CGRect)bounds;
//
//- (void)drawTextInRect:(CGRect)rect;
//- (void)drawPlaceholderInRect:(CGRect)rect;

@end

