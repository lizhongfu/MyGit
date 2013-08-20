//
//  AppDelegate.m
//  ARCBaseUse
//
//  Created by Zogful.Lee on 13-2-6.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize string1, string2;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    

    
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
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark-
#pragma mark User Methods

- (NSString *) stringTest __attribute__ ((ns_returns_autoreleased))
{
//    NSString *str = [[NSString alloc] initWithString:@"TEST"];
    NSString *str = [[NSString alloc] initWithFormat:@"%@", @"sss"];
    return str;
}

//返回一个自动释放对象，不过都不建意这样写代码
- (NSString *) stringTest_A
{
    __autoreleasing NSString *retStr = [[NSString alloc] initWithFormat:@"%@", @"sss"];
    
    return retStr;
}

@end
