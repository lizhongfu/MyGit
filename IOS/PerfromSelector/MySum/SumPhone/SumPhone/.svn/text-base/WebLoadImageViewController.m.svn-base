//
//  WebLoadImageViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WebLoadImageViewController.h"

@interface WebLoadImageViewController ()

@end

@implementation WebLoadImageViewController

+ (NSString *)friendlyName {
    return @"UIWebView载入本地图片";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    UIWebView *myWeb = [[[UIWebView alloc] initWithFrame:BaseFrame] autorelease];
    [self.view addSubview:myWeb];
    
    NSString *HTMLData = @"Hello this is a test Hello this is a test Hello this is a test Hello this is a test Hello this is a test<p><img src=\"UI继承图.gif\" alt=\"picture\"/>";
	[myWeb loadHTMLString:HTMLData baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
