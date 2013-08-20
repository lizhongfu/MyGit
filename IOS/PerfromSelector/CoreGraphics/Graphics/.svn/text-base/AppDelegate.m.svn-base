//
//  AppDelegate.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-10.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
   
    RootViewController *vc = [RootViewController new];
    
    UINavigationController *nav = [UINavigationController new];
    [nav pushViewController:vc animated:NO];
    
    self.window.rootViewController = nav;
    
    [vc release];
    [nav release];
    
    self.window.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
