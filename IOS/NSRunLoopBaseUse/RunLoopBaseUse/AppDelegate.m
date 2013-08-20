//
//  AppDelegate.m
//  RunLoopBaseUse
//
//  Created by Zogful.Lee on 13-2-9.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "DocViewController.h"

@implementation AppDelegate

@synthesize window;

- (void)dealloc
{
    [window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    DocViewController *vc = [DocViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    [vc release];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    UIView *superView = [[UIView alloc] init];
    
    UIView *subView = [[UIView alloc] init];   //subView的retainCount: 1
    
    [superView addSubview:subView];            //subView的retainCount: 2
    
    [subView release];                         //subView的retainCount: 1
    
    [superView release];                       //subView的retainCount: 0  实际没办法打印
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
