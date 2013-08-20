//
//  UILabdelViewController.m
//  UILabdel
//
//  Created by LiTao on 11-10-9.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UILabdelViewController.h"

@implementation UILabdelViewController

@synthesize firstLabel, secondLabel, thirdyLabel, fourthLabel;

+ (NSString *)friendlyName {
    return @"UILabel特殊字体效果";
}

- (void)dealloc
{
    [super dealloc];
    [firstLabel release];
    [secondLabel release];
    [thirdyLabel release];
    [fourthLabel release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    self.view.frame = BaseFrame;
    
    float dWide = self.view.frame.size.width;
    float dHeight = self.view.frame.size.height;
    
    

    firstLabel = [[FXLabel alloc] init];
    firstLabel.frame = CGRectMake(0, dHeight/9, dWide, dHeight/9);
    firstLabel.backgroundColor = [UIColor clearColor];
    firstLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:35];
    firstLabel.text = @"第一种效果";
    firstLabel.textColor = [UIColor grayColor];
    firstLabel.shadowColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
    firstLabel.shadowOffset = CGSizeMake(1.0f, 2.0f);
    
//    自动适应label的宽，字数多了，字就小，字少了，字就大
//    firstLabel.adjustsFontSizeToFitWidth = YES;

//    模糊
    firstLabel.shadowBlur = 1.0f;
    
//    这样就产生立体效果了
    firstLabel.innerShadowColor = [UIColor colorWithWhite:0.0f alpha:0.8f];
    
    firstLabel.innerShadowOffset = CGSizeMake(1.0f, 2.0f);    
    [self.view addSubview:firstLabel];
    
    
    secondLabel = [[FXLabel alloc] init];
    secondLabel.frame = CGRectMake(0, 3*dHeight/9, dWide, dHeight/9);
    secondLabel.backgroundColor = [UIColor clearColor];
    secondLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:35];
    secondLabel.text = @"第二种效果";
    secondLabel.textColor = [UIColor whiteColor];
    secondLabel.shadowColor = [UIColor colorWithWhite:0.0f alpha:0.75f];
    secondLabel.shadowOffset = CGSizeMake(0.0f, 5.0f);
    secondLabel.shadowBlur = 5.0f;
    [self.view addSubview:secondLabel];
    
    thirdyLabel = [[FXLabel alloc] init];
    thirdyLabel.frame = CGRectMake(0, 5*dHeight/9, dWide, dHeight/9);
    thirdyLabel.backgroundColor = [UIColor clearColor];
    thirdyLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:35];
    thirdyLabel.text = @"第三种效果";
    thirdyLabel.gradientStartColor = [UIColor redColor];
    thirdyLabel.gradientEndColor = [UIColor blackColor];    
    [self.view addSubview:thirdyLabel];

    fourthLabel = [[FXLabel alloc] init];
    fourthLabel.frame = CGRectMake(0, 7*dHeight/9, dWide, dHeight/9);
    fourthLabel.backgroundColor = [UIColor clearColor];
    fourthLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:35];
    fourthLabel.text = @"第四种效果";
    fourthLabel.shadowColor = [UIColor blackColor];
    fourthLabel.shadowOffset = CGSizeZero;
    fourthLabel.shadowBlur = 20.0f;
    fourthLabel.innerShadowColor = [UIColor yellowColor];
    fourthLabel.innerShadowOffset = CGSizeMake(1.0f, 2.0f);
    fourthLabel.gradientStartColor = [UIColor redColor];
    fourthLabel.gradientEndColor = [UIColor yellowColor];
    fourthLabel.gradientStartPoint = CGPointMake(0.0f, 0.5f);
    fourthLabel.gradientEndPoint = CGPointMake(1.0f, 0.5f);  
    [self.view addSubview:fourthLabel];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
