//
//  ArchAppDelegate.m
//  Architect
//
//  Created by Zogful.Lee on 13-3-29.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ArchAppDelegate.h"

#import "ArchViewController.h"

@implementation ArchAppDelegate
@synthesize window = _window, reachabilityHostName = _reachabilityHostName, \
netStatus = _netStatus, monitorNet, launchOptionsDic = _launchOptionsDic, noticeNetChange = _noticeNetChange;

- (void)dealloc
{
    [_window release];
    [_reachability release];
    [_reachabilityHostName release];
    [_launchOptionsDic release];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}

- (id) init
{
    if (self = [super init])
    {
        _netStatus = YES;
        _reachability = nil;
    }
    
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.launchOptionsDic = [[NSDictionary dictionaryWithDictionary:launchOptions] retain];
    self.noticeNetChange = [[self.launchOptionsDic objectForKey:kArchShowNoticeNetChange] boolValue];
    _monitorNet = (BOOL)[[launchOptions objectForKey:kArchIFAppDelegateMonitorNet] boolValue];
    
    if (_monitorNet)  //监视网络状况
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reachabilityChanged:)
                                                     name:kReachabilityChangedNotification
                                                   object:nil];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            if (!_reachability)
            {
                if (!_reachabilityHostName)
                {
                    _reachabilityHostName = @"www.apple.com";
                }
                _reachability = [[Reachability reachabilityWithHostName:_reachabilityHostName] retain];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [_reachability startNotifier];
            });
        });
    }
    
    CGRect wRect = CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-20);
    self.window = [[[UIWindow alloc] initWithFrame:wRect] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    if (!_cleaeHoldWindow) {
        CGRect frame = CGRectMake(0.0, 0.0, [[UIScreen mainScreen] bounds].size.width, 50.0);
        _cleaeHoldWindow = [[UIWindow alloc] initWithFrame:frame];
        _cleaeHoldWindow.rootViewController = [[UIViewController new] autorelease];
        [_cleaeHoldWindow setBackgroundColor:[UIColor clearColor]];
        [_cleaeHoldWindow setWindowLevel:UIWindowLevelStatusBar+1.0f];
        [_cleaeHoldWindow makeKeyAndVisible];
    }
    
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

#pragma mark -
#pragma mark 启用网络监视

-(void)reachabilityChanged:(NSNotification *)note
{
	Reachability *curReach = [note object];
	NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
	_netStatus = [curReach currentReachabilityStatus];
    
    switch (_netStatus) {
            
        case NotReachable:
            
            if (_noticeNetChange)
            {
                WBErrorNoticeView *notice = [WBErrorNoticeView errorNoticeInView:_cleaeHoldWindow title:@"提示" message:@"网络连接失败"];
                [notice show];
            }
            
            break;
            
        case ReachableViaWiFi:
            
            if (_noticeNetChange)
            {
                WBSuccessNoticeView *notice = [WBSuccessNoticeView successNoticeInView:_cleaeHoldWindow title:@"当前网络:ReachableViaWiFi"];
                [notice show];
            }
            
            break;
            
        case ReachableViaWWAN:
            if (_noticeNetChange)
            {
                WBSuccessNoticeView *notice = [WBSuccessNoticeView successNoticeInView:_cleaeHoldWindow title:@"当前网络:ReachableViaWWAN"];
                [notice show];
            }
            
            break;
            
        default:
            
            if (_noticeNetChange)
            {
                WBErrorNoticeView *notice = [WBErrorNoticeView errorNoticeInView:_cleaeHoldWindow title:@"提示" message:@"网络异常"];
                [notice show];
            }
            
            break;
    }
}

@end
