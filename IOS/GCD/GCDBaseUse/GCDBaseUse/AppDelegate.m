//
//  AppDelegate.m
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-2-6.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

NSTimer *timer;

@implementation AppDelegate

- (NSString*)encodeURL:(NSString *)string
{
	NSString *newString = [NSMakeCollectable(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding))) autorelease];
	if (newString) {
		return newString;
	}
    
	return @"";
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.rootViewController = [[RootViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.rootViewController];
    self.window.rootViewController = nav;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
//    NSDictionary  * loginData=[NSDictionary  dictionaryWithObjectsAndKeys:
//                               @"UserName", @"UserName",
//                               @"Password", @"Password",
//                               @"Password2", @"Password2",
//                               @"EMail", @"EMail",
//                               nil];
//    
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    [params setObject:[self encodeURL:@"123@126.com"] forKey:@"account"];
//    [params setObject:[self encodeURL:@"123"] forKey:@"password"];
// 
//
//    RESTHelper  * hlp =[[ RESTHelper  alloc] initWithUrl:@"http://hiweibo.sinaapp.com/api/user/get_token"
//                                                postData: params
//                                                delegate: self
//                                         onErrorCallback:@selector(errorCallback:)
//                                     onCompletedCallback:@selector(completedCallback:)];
//    [hlp release];
}

-(void)  errorCallback:(NSError*) error
{
    NSLog(@"errorCallback:%@", [error localizedDescription]);
}

/*数据下载完毕 */
-(void)  completedCallback:(NSString*) data
{
    NSLog(@"completedCallback:%@", data);
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark -
#pragma mark 实现后台运行

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self beingBackgroundUpdateTask];
    
    sleep(30);
    
    [self endBackgroundUpdateTask];
}

- (void)beingBackgroundUpdateTask
{
    NSLog(@"beingBackgroundUpdateTask");
    
    self.backgroundUpdateTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateTask];
    }];
}

- (void)endBackgroundUpdateTask
{
    [[UIApplication sharedApplication] endBackgroundTask: self.backgroundUpdateTask];
    self.backgroundUpdateTask = UIBackgroundTaskInvalid;
    
    NSLog(@"endBackgroundUpdateTask");
}

#pragma mark -

@end
