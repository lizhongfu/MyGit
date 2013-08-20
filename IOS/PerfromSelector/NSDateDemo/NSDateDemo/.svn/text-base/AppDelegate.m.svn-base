//
//  AppDelegate.m
//  NSDateDemo
//
//  Created by Zogful.Lee on 13-3-19.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/CoreAnimation.h>
#import "DateHelper.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (void) test
{
    NSString *currData = [[DateHelper sharedDateHelper] stringFromDate:[NSDate date]];
    NSLog(@"%@", currData);
    
    NSDate *date = [[DateHelper sharedDateHelper] dateFromString:currData];
    NSLog(@"%@", [date descriptionWithLocale:[NSLocale autoupdatingCurrentLocale]]);
    NSLog(@"%@", [[DateHelper sharedDateHelper] stringFromDate:date]);
    
    double timestamp = [[DateHelper sharedDateHelper] timestampFromString:currData];
    NSLog(@"%f", timestamp);
    
    NSString *stampStr = [[DateHelper sharedDateHelper] stringFromTimestamp:timestamp];
    NSLog(@"%@", stampStr);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self test];
    
    return YES;
}

@end
