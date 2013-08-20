//
//  CNVLabelViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-8-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CNVLabelViewController.h"
#import "cnvUILabel.h"

@interface CNVLabelViewController ()

@end

@implementation CNVLabelViewController

+ (NSString *)friendlyName {
    return @"UILabel字体在左上角（CoreText）";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
	
    cnvUILabel *lab = [[cnvUILabel alloc] initWithFrame:CGRectMake(100, 260, 200, 100)];
    NSString *textStr = @"苹果英文文档核心文档编程指南";
    [lab cnv_setUILabelText:textStr andKeyWord:@"文档核心"];
    
    lab.font = [UIFont systemFontOfSize:30];
    // 设置关键字为蓝色，其他字为红色
    [lab cnv_setUIlabelTextColor:[UIColor redColor]  andKeyWordColor:[UIColor blueColor] ];
    lab.backgroundColor = [UIColor yellowColor];
    //  [lab sizeToFit];
    [self.view addSubview:lab];
    [lab release];
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
