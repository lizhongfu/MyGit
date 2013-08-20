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
    [dic setObject:@(YES) forKey:kArchIFAppDelegateMonitorNet];
    [dic setObject:@"www.baidu.com" forKey:kArchReachabilityHostName];
    [dic setObject:@(YES) forKey:kArchShowNoticeNetChange];
    
    if (![super application:application didFinishLaunchingWithOptions:dic])
    {
        NSLog(@"应用要求网络链接，但当前网络断开");
        
        return NO;
    }
    
    ArchViewController *vc = [[ArchViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
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

@end
