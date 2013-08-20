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


#pragma mark -
#pragma mark MemeryMangage

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
            
            //   如果_reachability为nil，就初始化，如果没有指定host name，就用www.apple.com
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
    
    //    一个透明的window，位置在顶端
    if (!_headWindow) {
        CGRect frame = CGRectMake(0.0, 0.0, [[UIScreen mainScreen] bounds].size.width, 50.0);
        _headWindow = [[UIWindow alloc] initWithFrame:frame];
        _headWindow.rootViewController = [[UIViewController new] autorelease];
        [_headWindow setBackgroundColor:[UIColor clearColor]];
        [_headWindow setWindowLevel:UIWindowLevelStatusBar+1.0f];
        [_headWindow makeKeyAndVisible];
    }
    
    //    初始化主window
    CGRect wRect = CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-20);
    self.window = [[[UIWindow alloc] initWithFrame:wRect] autorelease];
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
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self beingBackgroundTask];
    
    sleep(10);
    
    [self endBackgroundTask];
}

#pragma mark -
#pragma mark 配合 applicationDidEnterBackground: 方法完成长时间后台运新

- (void)beingBackgroundTask
{
    _backgroundTaskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundTask];
    }];
}

- (void)endBackgroundTask
{
    [[UIApplication sharedApplication] endBackgroundTask:_backgroundTaskIdentifier];
    _backgroundTaskIdentifier = UIBackgroundTaskInvalid;
}

#pragma mark -
#pragma mark 网络监视回调

-(void)reachabilityChanged:(NSNotification *)note
{
	Reachability *curReach = [note object];
	NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
	_netStatus = [curReach currentReachabilityStatus];
    
    if (!_noticeNetChange)
    {
        return;
    }
    
    switch (_netStatus)
    {
        case NotReachable:
        {
            WBErrorNoticeView *notice = [WBErrorNoticeView errorNoticeInView:_headWindow title:@"提示" message:@"网络连接失败"];
            [notice show];
            
            break;
        }
        case ReachableViaWiFi:
        {
            WBSuccessNoticeView *notice = [WBSuccessNoticeView successNoticeInView:_headWindow title:@"当前网络:ReachableViaWiFi"];
            [notice show];
            
            break;
        }
        case ReachableViaWWAN:
        {
            WBSuccessNoticeView *notice = [WBSuccessNoticeView successNoticeInView:_headWindow title:@"当前网络:ReachableViaWWAN"];
            [notice show];
            
            break;
        }
        default:
        {
            WBErrorNoticeView *notice = [WBErrorNoticeView errorNoticeInView:_headWindow title:@"提示" message:@"网络异常"];
            [notice show];
        }
    }
}

@end
