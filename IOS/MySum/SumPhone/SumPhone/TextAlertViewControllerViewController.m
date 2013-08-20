//
//  TextAlertViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TextAlertViewControllerViewController.h"

@interface TextAlertViewController ()

@end

@implementation TextAlertViewController

+ (NSString *)friendlyName {
    return @"UIAlert输入文本及内容获取";
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	printf("User Pressed Button %d\n", buttonIndex + 1);
	[alertView release];
}

- (void) performDismiss: (NSTimer *)timer
{
    //    获取输入的内容
    
    UITextField *aText = [baseAlert textFieldAtIndex:0];
    UITextField *bText = [baseAlert textFieldAtIndex:1];
    NSLog(@"%@=%@", aText.text, bText.text);
    
	[baseAlert dismissWithClickedButtonIndex:0 animated:NO];
	[baseAlert release];
	baseAlert = NULL;
}

- (void) presentSheet
{
	baseAlert = [[UIAlertView alloc] 
                 initWithTitle:@"Alert" message:nil 
                 delegate:self cancelButtonTitle:nil
                 otherButtonTitles: nil];
    
    baseAlert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
	[NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector: @selector(performDismiss:)
								   userInfo:nil repeats:NO];
	[baseAlert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.frame = BaseFrame;
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
											   initWithTitle:@"点击显示Alert" 
											   style:UIBarButtonItemStylePlain 
											   target:self 
											   action:@selector(presentSheet)] autorelease];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
