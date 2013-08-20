//
//  AppDelegate.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

/*
 知识点：
  UITabBarController的使用
 */

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabController;

- (void)dealloc
{
    [_window release];
    [tabController release];
    
    [super dealloc];
}

- (void) buildView {
    
    
    self.tabController = [[[UITabBarController alloc] init] autorelease];
    self.tabController.delegate = self;
    
    ViewPartViewController *viewParty = [[[ViewPartViewController alloc] init] autorelease];
    DataPartViewController *dataParty = [[[DataPartViewController alloc] init] autorelease];
    OtherViewController *other = [[[OtherViewController alloc] init] autorelease];
    
    NSMutableArray *tabViewControllers = [NSMutableArray arrayWithCapacity:0];
    UINavigationController *navView = [[[UINavigationController alloc] initWithRootViewController:viewParty] autorelease];
    navView.title = @"界面";
    
    UINavigationController *navData = [[[UINavigationController alloc] initWithRootViewController:dataParty] autorelease];
    navData.title = @"数据";
    
    UINavigationController *navOther = [[[UINavigationController alloc] initWithRootViewController:other] autorelease];
    navOther.title = @"其它";
    
    [tabViewControllers addObject:navView];
    [tabViewControllers addObject:navData];
    [tabViewControllers addObject:navOther];
    
    self.tabController.viewControllers = tabViewControllers;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self buildView];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = self.tabController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

#pragma mark -
#pragma mark applicationDidEnterBackground
- (void) bgTask
{
}

- (void) finishBgTask: (NSNumber *) aId {
    //告诉系统我们完成了
    [[UIApplication sharedApplication] endBackgroundTask:[aId intValue]];
}

//实现按HOME键和POWER键有相同的进入后台时间。（POWER 更快）
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    UIApplication *app = [UIApplication sharedApplication];
    
//一个后台任务标识符
    UIBackgroundTaskIdentifier taskID = 0;
    taskID = [app beginBackgroundTaskWithExpirationHandler:^{
        
//如果系统觉得我们还是运行了太久，将执行这个程序块，并停止运行应用程序
        [app endBackgroundTask:taskID];
    }];
//UIBackgroundTaskInvalid表示系统没有为我们提供额外的时候
    if (taskID == UIBackgroundTaskInvalid) {
        NSLog(@"Failed to start background task!");
        return;
    }
    
    [self bgTask];
    
    [self performSelector:@selector(finishBgTask:) withObject:[NSNumber numberWithInteger:taskID] afterDelay:2];
}

#pragma mark -
- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma marl-
#pragma mark UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{  
//    tabbar上红圈，显示文本
//    viewController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",80];  
} 

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers {
    
}

- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {

}

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
    
}

@end
