//
//  FirstViewController.m
//  CoreImageDemo
//
//  Created by Zogful.Lee on 13-3-25.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //    延迟3S主队列执行
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt.frame = CGRectMake(20, 20, 280, 40);
    [bt addTarget:self action:@selector(aSelector:) forControlEvents:UIControlEventTouchUpInside];
    [bt setTitle:@"延迟3秒主队列执行" forState:UIControlStateNormal];
    [self.view addSubview:bt];
    
    //    同步批量并发执行
    UIButton *bt1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt1.frame = CGRectMake(20, 70, 280, 40);
    [bt1 addTarget:self action:@selector(aSelector1:) forControlEvents:UIControlEventTouchUpInside];
    [bt1 setTitle:@"同步批量并发执行" forState:UIControlStateNormal];
    [self.view addSubview:bt1];
    
    //    延迟3S全局队列执行
    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt2.frame = CGRectMake(20, 120, 280, 40);
    [bt2 addTarget:self action:@selector(aSelector2:) forControlEvents:UIControlEventTouchUpInside];
    [bt2 setTitle:@"延迟3秒全局队列执行" forState:UIControlStateNormal];
    [self.view addSubview:bt2];
    
    //    只执行一次
    UIButton *bt3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt3.frame = CGRectMake(20, 170, 280, 40);
    [bt3 addTarget:self action:@selector(aSelector3:) forControlEvents:UIControlEventTouchUpInside];
    [bt3 setTitle:@"只执行一次" forState:UIControlStateNormal];
    [self.view addSubview:bt3];
    
    //    按顺序执行一组，然后执行XX
    UIButton *bt4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt4.frame = CGRectMake(20, 220, 280, 40);
    [bt4 addTarget:self action:@selector(aSelector4:) forControlEvents:UIControlEventTouchUpInside];
    [bt4 setTitle:@"按顺序执行一组，然后执行XX" forState:UIControlStateNormal];
    [self.view addSubview:bt4];
    
    //    无序的用一个办法处理一组数据，然后执行XX
    
    //    按顺序执行一组，然后执行XX
    UIButton *bt5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt5.frame = CGRectMake(20, 270, 280, 40);
    [bt5 addTarget:self action:@selector(aSelector5:) forControlEvents:UIControlEventTouchUpInside];
    [bt5 setTitle:@"按顺序执行一组，然后执行XX" forState:UIControlStateNormal];
    [self.view addSubview:bt5];
}

@end
