//
//  ArchAppDelegate.h
//  Architect
//
//  Created by Zogful.Lee on 13-3-29.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "WBSuccessNoticeView.h"
#import "WBErrorNoticeView.h"

#define kArchIFAppDelegateMonitorNet   @"ArchIFAppDelegateMonitorNet"
#define kArchReachabilityHostName      @"ArchReachabilityHostName"
#define kArchShowNoticeNetChange       @"ArchShowNoticeNetChange"

@interface ArchAppDelegate : UIResponder <UIApplicationDelegate>
{
    
@public
    

@private
    UIWindow *_window;
    UIWindow *_cleaeHoldWindow;
    BOOL _monitorNet;
    BOOL _noticeNetChange;
    Reachability *_reachability;
    NetworkStatus _netStatus;
    NSString *_reachabilityHostName;
    NSDictionary *_launchOptionsDic;
}

@property (retain, nonatomic) UIWindow *window;

/*
 * 是否开启监控网络
 */
@property (assign, nonatomic) BOOL monitorNet;

/*
 * 指定一个网址，类似 www.baidu.com,来判断当前网络是否连接
 */
@property (copy, nonatomic) NSString *reachabilityHostName;

/*
 * 当前的网络连接状态：NotReachable = 0, ReachableViaWiFi = 1, ReachableViaWWAN = 2
 */
@property (assign, nonatomic, readonly) NetworkStatus netStatus;

/*
 * 是否提醒网络环境发生变化
 */
@property (assign, nonatomic) BOOL noticeNetChange;

/*
 * 存储启动参数
 */
@property (assign, nonatomic) NSDictionary *launchOptionsDic;

@end
