//
//  TestUIButtonViewController.m
//  TestUIButton
//
//  Created by Zogful Lee on 11-7-19.
//  Copyright 2011 sina. All rights reserved.
//

#import "TestUIButtonViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation TestUIButtonViewController

+ (NSString *)friendlyName {
    return @"UIButton基本";
}

- (void)viewDidLoad {
	
	NSString *stringURL = @"itms://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=467566074&mt=8";
	NSURL *url = [NSURL URLWithString:stringURL];
	[[UIApplication sharedApplication] openURL:url];
	
	
    [super viewDidLoad];
	
    
    CGRect buttonFrame = CGRectMake(0, 0, 30, 30);
    
		//创建按钮圆角矩形按钮
	UIButton *RoundedRectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [RoundedRectButton setFrame:buttonFrame];
	[RoundedRectButton setCenter:CGPointMake(30, 30)];
    
    
    
    
		//创建自定义类型按钮
	UIButton *CustomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [CustomButton setFrame:buttonFrame];
	[CustomButton setCenter:CGPointMake(30, 90)];
	[CustomButton setBackgroundColor:[UIColor greenColor]];
    
    //根据不同的状态改变按钮标题
	[CustomButton setTitle:@"NM" forState:UIControlStateNormal];
	[CustomButton setTitle:@"HL" forState:UIControlStateHighlighted];
    //根据不同的状态改变按钮标题颜色
	[CustomButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[CustomButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    //根据不同的状态改变按钮标题的阴影颜色
    //	[CustomButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //	[CustomButton setTitleShadowColor:[UIColor redColor] forState:UIControlStateHighlighted];	
    
    //得到按钮不同状态下的标题
	NSString *stateNormalTitle =  [CustomButton titleForState:UIControlStateHighlighted];
	NSString *stateHeilightedTitle =  [CustomButton titleForState:UIControlStateHighlighted];
	NSLog(@"%@***%@", stateNormalTitle, stateHeilightedTitle);
    //得到按钮不同状态下的标题颜色
	UIColor *stateNormalTitleColor = [CustomButton titleColorForState:UIControlStateNormal];
	NSLog(@"%@", [stateNormalTitleColor description]);
	
    //得到按钮不同状态下标题背景颜色
	UIColor *stateNormalTitleShadowColor = [CustomButton titleShadowColorForState:UIControlStateNormal];
	stateNormalTitleShadowColor = nil;
    
    //得到按钮不同状态下的图片
	UIImage *stateNormalImage = [CustomButton imageForState:UIControlStateNormal];
	stateNormalImage = nil;
    //得到按钮不同状态下的背景图片
	UIImage *stateNormalBackgroundImage = [CustomButton backgroundImageForState:UIControlStateNormal];
	stateNormalBackgroundImage = nil;
	
    // normal/highlighted/selected/disabled. can return nil
	NSString *currentTitle = CustomButton.currentTitle;
    currentTitle = nil;
    // normal/highlighted/selected/disabled. always returns non-nil. default is white(1,1)	
	UIColor *currentTitleColor = CustomButton.currentTitleColor;	
	currentTitleColor = nil;
    // normal/highlighted/selected/disabled. default is white(0,0.5).
	UIColor *currentTitleShadowColor = CustomButton.currentTitleShadowColor;
	currentTitleShadowColor = nil;
    // normal/highlighted/selected/disabled. can return nil
	UIImage *currentImage = CustomButton.currentImage;
	currentImage = nil;
	UIImage *currentBackgroundImage = CustomButton.currentBackgroundImage;
	currentBackgroundImage = nil;
    
	
    //新发现，哈哈哈
	UILabel *titleLabel = CustomButton.titleLabel;
	NSLog(@"titleLabel :%@", titleLabel);
	titleLabel.font = [UIFont boldSystemFontOfSize:20]; 
    //[self.view addSubview:titleLabel];
	
	UIImageView *imageView = CustomButton.imageView;
	[imageView setImage:[UIImage imageNamed:@"dice1.png"]];
	[CustomButton.imageView setImage:[UIImage imageNamed:@"dice1.png"]];
	
	[CustomButton bringSubviewToFront:imageView];
    
    
    
    
    
		//创建细节展示附件，常在表中使用
	UIButton *DetailDisclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [DetailDisclosureButton setFrame:buttonFrame];
	[DetailDisclosureButton setCenter:CGPointMake(30, 180)];
    
    
		//信息或设置屏幕访问按钮
	UIButton *InfoLightButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [InfoLightButton setFrame:buttonFrame];
	[InfoLightButton setCenter:CGPointMake(30, 270)];
    
    
	UIButton *InfoDarkButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [InfoDarkButton setFrame:buttonFrame];
	[InfoDarkButton setCenter:CGPointMake(30, 350)];
    
    
		//添加按钮
	UIButton *ContactAddButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [ContactAddButton setFrame:buttonFrame];
	[ContactAddButton setCenter:CGPointMake(30, 430)];
    
	
	UIButton *aabutton = [UIButton buttonWithType:102];
	aabutton.center = CGPointMake(100, 350);
	[self.view addSubview:aabutton];
//	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
//	nav.navigationItem.rightBarButtonItem = UIBarButtonItemStyleDone;
	

	
	
		//按钮　buttonType　只读属性的使用
	UIButton *CustomButton1 = [UIButton buttonWithType:CustomButton.buttonType];
	CustomButton1.frame = CGRectMake(0, 0, 120, 120);
	CustomButton1.center = CGPointMake(150, 90);
	
	[CustomButton1 setTitle:@"AAA" forState:UIControlStateNormal];
		//设置按钮图片，则图片不随按钮大小变化而变化，标题也不显示
//	[CustomButton1 setImage:[UIImage imageNamed:@"Button.png"] forState:UIControlStateNormal];
//	[CustomButton1 setImage:[UIImage imageNamed:@"ButtonPressed.png"] forState:UIControlStateHighlighted];
		//设置按钮北京图片，则图片随按钮大小而变化，且标题可以显示
	[CustomButton1 setBackgroundImage:[UIImage imageNamed:@"blue_velvet_001.png"] forState:UIControlStateNormal];
	[CustomButton1 setBackgroundImage:[UIImage imageNamed:@"blue_velvet_001.png"] forState:UIControlStateHighlighted];
	
	
	
	
	[self.view addSubview:RoundedRectButton];
	[self.view addSubview:CustomButton];
	[self.view addSubview:CustomButton1];
	[self.view addSubview:DetailDisclosureButton];
	[self.view addSubview:InfoLightButton];
	[self.view addSubview:InfoDarkButton];
	[self.view addSubview:ContactAddButton];
	
	
	UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
	[bt setBackgroundColor:[UIColor underPageBackgroundColor]];

    bt.frame = CGRectMake(100, 200, 100, 100);
    bt.titleLabel.text = @"AAAA";
	bt.titleLabel.textColor = [UIColor redColor];
    
    [bt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
    
//    关键代码
    [bt.layer setMasksToBounds:YES];
    [bt.layer setCornerRadius:10.0]; //设置矩形四个圆角半径 
    [bt.layer setBorderWidth:5.0]; //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB(); 
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 }); 
    [bt.layer setBorderColor:colorref];//边框颜色
    
    [self.view addSubview:bt];
	
	
}


- (void)dealloc {
    [super dealloc];
}

@end
