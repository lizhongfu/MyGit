//
//  AppDelegate.m
//  Architect
//
//  Created by Zogful.Lee on 13-3-29.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "ArchViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    
    [dic setObject:@(YES) forKey:kArchIFAppDelegateMonitorNet];/*启动监控网络*/
    [dic setObject:@"www.baidu.com" forKey:kArchReachabilityHostName];/*指定监控的网址*/
    [dic setObject:@(YES) forKey:kArchShowNoticeNetChange];
    
    if (![super application:application didFinishLaunchingWithOptions:dic])
    {
        NSLog(@"应用要求网络链接，但当前网络断开");
        
        return NO;
    }
    
    ArchViewController *vc = [[ArchViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    [self getData];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [super applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [super applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [super applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [super applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [super applicationWillTerminate:application];
}

- (void) getData
{
    NSMutableString *urlBase = [[NSMutableString alloc] initWithString:@"http://localhost:8888/mobileTest/getData.php"];
    [urlBase appendFormat:@"?username=%@", @"li"];
    
    NSURL *url = [NSURL URLWithString:urlBase];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request setTimeOutSeconds:10];
    [request setDidFinishSelector:@selector(requestDone:)];
    [request setDidFailSelector:@selector(requestWentWrong:)];
    [request startAsynchronous];
}

- (void)requestDone:(ASIHTTPRequest *)request
{
    NSString *response = [request responseString];
    
    NSLog(@"Code:%d",[request responseStatusCode]);
    NSLog(@"requestURL:%@", [request url]);
    NSLog(@"requestDone:%@", [response objectFromJSONString]);
}
- (void)requestWentWrong:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"requestWentWrong:%@", [error localizedDescription]);
}

@end
