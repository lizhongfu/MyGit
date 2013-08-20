//
//  AutoSizeLabelViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AutoSizeLabelViewController.h"

@interface AutoSizeLabelViewController ()

@end

@implementation AutoSizeLabelViewController

+ (NSString *)friendlyName {
    return @"UILabel自适应大小";
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
	
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height/4)];
    aView.center = self.view.center;
    aView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    [self.view addSubview:aView];
    [aView release];
    
    
    UILabel *detaillabel = [[UILabel alloc] init]; 
	detaillabel.textColor = [UIColor redColor];
	detaillabel.backgroundColor = [UIColor grayColor];
	detaillabel.numberOfLines = 0;
    detaillabel.backgroundColor = [UIColor whiteColor];
    
    NSString *title = @"CGSize size = [testString sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:constraint lineBreakMode: ";
	detaillabel.text = title;
	
	//计算文字高度
	CGSize constraint = CGSizeMake(aView.frame.size.width, aView.frame.size.height);
	CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
	NSInteger height = MAX(size.height, aView.frame.size.height-10);
	[detaillabel setFrame:CGRectMake(5, 5, aView.frame.size.width-10, height)];
	
	[aView addSubview:detaillabel];
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
