//
//  DateHelper.h
//  NSDateDemo
//
//  Created by Zogful.Lee on 13-3-19.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject
{
    NSString *_dateFormatDH;
    NSString *_timeZoneDH;
}

@property (nonatomic, retain) NSString *dateFormatDH;
@property (nonatomic, retain) NSString *timeZoneDH;

+ (DateHelper *)sharedDateHelper;

- (void) defaultSet;

//时间字符串转化成时间 NSDate
- (NSDate *) dateFromString:(NSString *) dateString; 

- (NSString *) stringFromDate:(NSDate *) date;

//时间字符串转化成时间戳 NSTimeInterval
- (NSTimeInterval) timestampFromString:(NSString *) dateString; 

- (NSString *) stringFromTimestamp:(NSTimeInterval) timeInterval;

@end
