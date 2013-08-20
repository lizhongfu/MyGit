//
//  NSDateStudyDemoViewController.m
//  NSDateStudyDemo
//
//  Created by 忠福 李 on 12-2-29.
//  Copyright 2012年 通卡网络. All rights reserved.
//

#import "NSDateStudyDemoViewController.h"

@implementation NSDateStudyDemoViewController

+ (NSString *)friendlyName {
    return @"NSDate学习";
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    NSDate *date = [NSDate date];
    
    
    //处理后台秒形式的时间
    NSTimeInterval secs= 86400;
    
    NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *theDay =  [[NSDate alloc] initWithTimeIntervalSince1970:secs];
    NSString *time_str = [dateFormatter stringFromDate:theDay];
    NSLog(@"time_str:%@", time_str);
    
    if ([date compare:theDay]) {
        NSLog(@"11");
    } else {
        NSLog(@"00");
    }
}
@end


