//
//  AddressBookViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AddressBookViewController.h"

@interface AddressBookViewController ()

@end

@implementation AddressBookViewController

+ (NSString *)friendlyName {
    return @"AddressBook使用";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.frame = BaseFrame;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 50, 200, 40);
    [button addTarget:self action:@selector(btAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"打开地址薄" forState:UIControlStateNormal];
    button.center = self.view.center;
    
    [self.view addSubview:button];
    
}

- (void) btAction {
    // creating the picker
	ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
	// place the delegate of the picker to the controll
	picker.peoplePickerDelegate = self;
	
	// showing the picker
	[self presentModalViewController:picker animated:YES];
	// releasing
	[picker release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    // assigning control back to the main controller
	[self dismissModalViewControllerAnimated:YES];
}

- (BOOL)peoplePickerNavigationController: (ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	
    NSString *firstName = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
	
    NSString *lastName = (NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);	
	
	ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
	NSString *number = (NSString*)ABMultiValueCopyValueAtIndex(multi, 0);
	
    UILabel *msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 320, 160)];
    msgLabel.numberOfLines = 0;
    msgLabel.text = [NSString stringWithFormat:@"firstName:%@\nlastName:%@\nnumber:%@\n"];
    
    [self.view addSubview:msgLabel];
    [msgLabel release];
    
	// remove the controller
    [self dismissModalViewControllerAnimated:YES];
    
    return NO;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}

@end
