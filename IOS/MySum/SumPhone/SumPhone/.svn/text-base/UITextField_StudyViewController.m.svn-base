//
//  UITextField_StudyViewController.m
//  UITextField_Study
//
//  Created by 李 忠福 on 11-11-8.
//  Copyright 2011 软通动力. All rights reserved.
//

#import "UITextField_StudyViewController.h"

@implementation UITextField_StudyViewController
@synthesize textField;

/*
 图片方面需要注意的问题：如果你是在iOS4上面写的话，你会需要这2个，因为iOS4上面的软键盘左下角没圆角

 */

+ (NSString *)friendlyName {
    return @"UITextField数字键盘按钮自定义";
}

- (void)viewDidLoad {
	
    [super viewDidLoad];
    self.view.frame = BaseFrame;
	
	//NSLog(@"%@", [[UIApplication sharedApplication] windows]);
	
	textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
	textField.center = CGPointMake(160, 160);
	textField.borderStyle = UITextBorderStyleRoundedRect;
	textField.keyboardType = UIKeyboardTypeNumberPad;
//	textField.delegate = self;
	
	[self.view addSubview:textField];
	
	
	/*接着就开始写代码来把贴有这个图片的UIButton在需要的时候加到那个空位那里了。
	 幸好有专门的notification是帮你做这件事情的。所以在需要键盘出来之前，例如
	 是点击UITextField的当下，往NSNotificationCenter注册一下这个notification就可以了。
	 
	 
	 在iphone 3.2 SDK之前，注册的是 UIKeyboardWillShowNotification，
	 iOS4开始就要用 UIKeyboardDidShowNotification了。
	 
	 
	 然后在用完键盘之后要记得从NSNotificationCenter注销掉，不然你的别的软键盘都会粘上这个按钮了。
	 */
	
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(addButtonToKeyboard)
													 name:UIKeyboardDidShowNotification
												   object:nil];
	} else {
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(addButtonToKeyboard)
													 name:UIKeyboardWillShowNotification
												   object:nil];
	}
	
	//[[NSNotificationCenter defaultCenter] removeObserver:self];
}


/*人已经找到了其实keyboard view就是在app的第二个UIWindow（看这里）。遍历一下这个UIWindow的孩子们，
 找到keyboard view，然后把UIButton贴到左下角。需要注意的是iOS4的keyboard view的description跟
 iphone3.2之前的是不一样的噢。*/

- (void)addButtonToKeyboard {
    // create custom button
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(0, 163, 106, 53);
    doneButton.adjustsImageWhenHighlighted = NO;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
        [doneButton setImage:[UIImage imageNamed:@"DoneUp.png"]
					forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"DoneDown3.png"]
					forState:UIControlStateHighlighted];
    } else {
        [doneButton setImage:[UIImage imageNamed:@"DoneUp.png"]
					forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"DoneDown.png"]
					forState:UIControlStateHighlighted];
    }
    [doneButton addTarget:self 
				   action:@selector(doneButton:)
		 forControlEvents:UIControlEventTouchUpInside];
    // locate keyboard view
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    UIView* keyboard;
    for(int i=0; i<[tempWindow.subviews count]; i++) {
        keyboard = [tempWindow.subviews objectAtIndex:i];
		
		
		
        //有两个方法，可以用在IOS5的
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
            if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
                [keyboard addSubview:doneButton];
        } else {
            if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
                [keyboard addSubview:doneButton];
        }
		
		//if(([[keyboard description] hasPrefix:@"<UIPeripheralHostView"] == YES)||[[keyboard description] hasPrefix:@"<UIKeyboard"] == YES){
//			CGRect frame = CGRectMake(0.0f, 162.0f, 106.0f, 53.0f);
//			if ((orientation == UIInterfaceOrientationLandscapeLeft) || (orientation == UIInterfaceOrientationLandscapeRight)){
//				frame = CGRectMake(0.0f, 116.0f, 162.0f, 53.0f);
//			}
//			[doneBt setFrame:frame];
//			[keyboard addSubview:doneBt];
//			break;
//		}
    }
	
	//[[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void) doneButton:(id) sender {
	[textField resignFirstResponder];
}

//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//	[self keyboardWillShow];
//	
//
//} 

- (void)keyboardWillShow:(NSNotification *)note {  
    // create custom button
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(0, 0, 106, 53);
	doneButton.backgroundColor = [UIColor redColor];
    doneButton.adjustsImageWhenHighlighted = NO;
    [doneButton setImage:[UIImage imageNamed:@"DoneUp.png"] forState:UIControlStateNormal];
    [doneButton setImage:[UIImage imageNamed:@"DoneDown.png"] forState:UIControlStateHighlighted];
    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
	//[self.view addSubview:doneButton];
    // locate keyboard view
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
	
	//NSLog(@"%@", [[UIApplication sharedApplication] windows]);
	NSLog(@"tempWindow: %d", [tempWindow.subviews count]);
	
    UIView* keyboard;
    for(int i=0; i<[tempWindow.subviews count]; i++) {
        keyboard = [tempWindow.subviews objectAtIndex:i];
		NSLog(@"tempWindow: %@", keyboard);
        // keyboard view found; add the custom button to it
        if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
            [keyboard addSubview:doneButton];
    }
//	for (UIView *keyboard in tempWindow.subviews) { 
//		if ([[[keyboard class] name] hasPrefix:@"UIKeyboard"]) { 
//			[keyboard addSubview:doneButton]; 
//			break; 
//		} 
//	} 
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
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

@end
