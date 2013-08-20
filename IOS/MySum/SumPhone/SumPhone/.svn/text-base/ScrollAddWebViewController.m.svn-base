//
//  ScrollAddWebViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ScrollAddWebViewController.h"

@interface ScrollAddWebViewController ()

@end

@implementation ScrollAddWebViewController

+ (NSString *)friendlyName {
    return @"UIScrollView加载Web";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"http://www.renren.com", @"http://www.baidu.com", @"http://www.koubei.com/beijing", nil];
    
    
    BDScrollWebView *web = [BDScrollWebView creatWebviewWithUrls:array 
                                                           frame:BaseFrame];
    [array release];
    
    [self.view addSubview:web.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
