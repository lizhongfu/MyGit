//
//  DownloadManagerViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DownloadManagerViewController.h"

#define kDocumentFolder	 [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] 

@interface DownloadManagerViewController ()

@end

@implementation DownloadManagerViewController

+ (NSString *)friendlyName {
    return @"UIAlertView下载过程演示";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
	
    // 普通方式:
	download=[[DownloadManager alloc]init];
	download.title=@"乱七八糟-1";
	download.fileURL=[NSURL URLWithString:@"http://www.plcsky.com:888/yl/ylsx/ljsy/images/2008/12/23/44610.mp3"];
	download.fileName=[kDocumentFolder stringByAppendingPathComponent:@"1.mp3"];
	download.delegate = self;
	[download start];
    
	// 扩充方式:
    //	NSURL *url=[NSURL URLWithString:@"http://www.plcsky.com:888/yl/ylsx/ljsy/images/2008/12/23/44610.mp3"];
    //	[url downloadWithDelegate:self Title:@"乱七八糟-2" WithToFileName:[kDocumentFolder stringByAppendingPathComponent:@"2.mp3"]];
    //	
    //	NSURL *url2=[NSURL URLWithString:@"http://www.plcsky.com:888/yl/ylsx/ljsy/images/2008/12/23/44610.mp3"];
    //	[url2 downloadWithDelegate:self Title:@"乱七八糟-3" WithToFileName:[kDocumentFolder stringByAppendingPathComponent:@"3.mp3"]];

}

- (void) downloadManagerDataDownloadFinished: (NSString *) fileName
{
    
	// 返回的fileName为保存的路径
	
}
- (void) downloadManagerDataDownloadFailed: (NSString *) reason
{
	
}

@end
