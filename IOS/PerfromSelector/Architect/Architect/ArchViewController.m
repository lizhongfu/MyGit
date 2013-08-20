//
//  ArchViewController.m
//  Architect
//
//  Created by Zogful.Lee on 13-3-29.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ArchViewController.h"
#import "Reachability.h"

#import "WBSuccessNoticeView.h"
#import "WBErrorNoticeView.h"

@interface ArchViewController ()
{
}

@end

@implementation ArchViewController


- (void) loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    WBSuccessNoticeView *notice = [WBSuccessNoticeView successNoticeInView:self.view title:@"当前网络:ReachableViaWWAN"];
    [notice show];
    
    WBErrorNoticeView *notice1 = [WBErrorNoticeView errorNoticeInView:self.view title:@"提示" message:@"网络异常"];
    [notice1 show];
}

@end
