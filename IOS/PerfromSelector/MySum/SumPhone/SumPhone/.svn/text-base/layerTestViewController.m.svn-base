//
//  layerTestViewController.m
//  layerTest
//
//  Created by Zogful Lee on 11-5-28.
//  Copyright 2011 sina. All rights reserved.
//

#import "layerTestViewController.h"

@implementation layerTestViewController

+ (NSString *)friendlyName {
    return @"UILayer使用总结";
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
    self.view.frame = BaseFrame;

	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom]; 
	btn.frame = CGRectMake(50, 180, 80, 40); 
	[btn.layer setMasksToBounds:YES]; 
	[btn.layer setCornerRadius:10.0]; //设置矩形四个圆角半径 
	[btn.layer setBorderWidth:5.0];	//边框宽度
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB(); 
	//CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 }); 
	[btn.layer setBorderColor:[UIColor redColor]];//边框颜色 
	[self.view addSubview:btn];
	
	//设置view的layer
	self.view.layer.backgroundColor = [UIColor orangeColor].CGColor;
	self.view.layer.cornerRadius = 20.0;
	self.view.layer.frame = CGRectInset(self.view.layer.frame, 20, 20);//定义layer在view中的内嵌程度
	
	//创建第一个layer
	CALayer *sublayer = [CALayer layer];
	sublayer.backgroundColor = [UIColor blueColor].CGColor;
	sublayer.shadowOffset = CGSizeMake(3, -5);//阴影的偏移量
	sublayer.shadowColor = [UIColor whiteColor].CGColor;
	sublayer.shadowOpacity = 0.8;//不透明，不透光
	sublayer.frame = CGRectMake(15, 15, 100, 180);
	
	sublayer.contents = (id)[UIImage imageNamed:@"01.png"].CGImage;
	sublayer.borderColor = [UIColor redColor].CGColor;
	sublayer.borderWidth = 5.0;
	
	//创建第二个layer
	CALayer *sublayer1 = [CALayer layer];
	sublayer1.backgroundColor = [UIColor blueColor].CGColor;
	sublayer1.shadowOffset = CGSizeMake(3, 6);//阴影偏移量
	sublayer1.shadowRadius = 5.0;//阴影的圆角角度
	sublayer1.shadowColor = [UIColor whiteColor].CGColor;//阴影颜色
	sublayer1.shadowOpacity = 0.8;//阴影透明度
	sublayer1.frame = CGRectMake(130, 100, 128, 192);
	
	sublayer1.borderColor = [UIColor greenColor].CGColor;//边界颜色
	sublayer1.borderWidth = 5.0;//边界宽度
	sublayer1.cornerRadius = 10.0;//边界角度
	
	CALayer *imageLayer = [CALayer layer];
	imageLayer.frame = sublayer1.bounds;
	imageLayer.cornerRadius = 10.0;
	imageLayer.contents = (id)[UIImage imageNamed:@"01.png"].CGImage;
	imageLayer.masksToBounds = YES;//设置子层也是圆角
	[sublayer1 addSublayer:imageLayer];
	
	
	[self.view.layer addSublayer:sublayer1];
	[self.view.layer addSublayer:sublayer];
	
	
}

- (void)dealloc {
    [super dealloc];
}

@end
