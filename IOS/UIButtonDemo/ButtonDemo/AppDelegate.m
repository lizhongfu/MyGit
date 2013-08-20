//
//  AppDelegate.m
//  ButtonDemo
//
//  Created by Zogful.Lee on 13-3-26.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];

//    ViewController *vc = [[ViewController alloc] init];
    
    ViewController *aVc = [[ViewController alloc] init];
    
    self.window.rootViewController = aVc;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
