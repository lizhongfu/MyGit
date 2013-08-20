//
//  DownloadManagerViewController.h
//  SumPhone
//
//  Created by Zogful Lee on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewBase.h"
#import "DownloadManager.h"
#import "NSURL+Download.h"

@interface DownloadManagerViewController : ViewBase <DownloadManagerDelegate> {
    DownloadManager *download;
}

@end


/*
 DownloadManager：
 1、NSURLConnection 使用方法
 2、delegate 委托使用方法
 3、NSFileManager 操作方法
 4、UIAlertView 消失方法
 5、NSNumberFormatter 使用方法
 6、C语言 FILE 使用方法
 7、@private 使用方法
 */