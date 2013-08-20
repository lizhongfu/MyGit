//
//  AppDelegate.m
//  RegexDemo
//
//  Created by Zogful.Lee on 13-3-5.
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
    
    RootTableViewController *vc = [[RootTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.window.rootViewController = vc;
    [vc release];
    
    NSString *aStr = @"111111442312.123123123";
    NSString *regularStr = [NSString stringWithFormat:@"\\w{4}\\.*"];
    NSRegularExpression *regularexpression = [NSRegularExpression regularExpressionWithPattern:regularStr
                                                                                       options:NSRegularExpressionDotMatchesLineSeparators
                                                                                         error:nil];
    NSArray *textArr = [regularexpression matchesInString:aStr options:0 range:NSMakeRange(0, [regularStr length])];
    
    for (NSTextCheckingResult *result in textArr)
    {
        NSLog(@"%@", [aStr substringWithRange:result.range]);
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
