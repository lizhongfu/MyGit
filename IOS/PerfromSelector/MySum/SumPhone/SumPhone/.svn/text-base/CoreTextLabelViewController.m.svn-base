//
//  CoreTextLabelViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CoreTextLabelViewController.h"

@interface CoreTextLabelViewController ()

@end

@implementation CoreTextLabelViewController

+ (NSString *)friendlyName {
    return @"UILabel字体在左上角（CoreText）";
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
	
    CustomLabel *lb = [[CustomLabel alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
	lb.text = @"1234567";
	
	[self.view addSubview:lb];
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
