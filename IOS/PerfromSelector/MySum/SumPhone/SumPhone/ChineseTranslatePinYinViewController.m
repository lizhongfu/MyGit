//
//  ChineseTranslatePinYinViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ChineseTranslatePinYinViewController.h"

@interface ChineseTranslatePinYinViewController ()

@end

@implementation ChineseTranslatePinYinViewController

+ (NSString *)friendlyName {
    return @"汉字转拼音";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, BaseFrame.size.width, 100)];
    label.text = [POAPinyin quickConvert:@"lizhongfu"];
    
    
    [self.view addSubview:label];
}

@end
