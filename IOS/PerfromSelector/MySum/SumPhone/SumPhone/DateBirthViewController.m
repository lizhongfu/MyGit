//
//  DateBirthViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DateBirthViewController.h"

@interface DateBirthViewController ()

@end

@implementation DateBirthViewController

+ (NSString *)friendlyName {
    return @"UIActionSheet生日选取";
}

//UIActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSLog(@"buttonIndex::%d", buttonIndex);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
	
    VlionActionSheet* sheet = [[VlionActionSheet alloc] initWithHeight:210.0f WithSheetTitle:@"请输入您的生日"];
    sheet.delegate = self;
	[sheet showInView:self.view];
    
	
	UIDatePicker *datePicker = [[[UIDatePicker alloc] init] autorelease];
	datePicker.frame = CGRectMake(0, 44, 320, 50);
	
	datePicker.locale = [NSLocale currentLocale];
	datePicker.timeZone=[NSTimeZone defaultTimeZone];
	datePicker.tag = 101102;
	datePicker.datePickerMode = UIDatePickerModeDate;
	[sheet addSubview:datePicker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
