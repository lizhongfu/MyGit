//
//  DateHelper.m
//  NSDateDemo
//
//  Created by Zogful.Lee on 13-3-19.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

@synthesize dateFormatDH = _dateFormatDH;
@synthesize timeZoneDH = _timeZoneDH;

- (void) dealloc
{
    [_dateFormatDH release];
    [_timeZoneDH release];
    
    [super dealloc];
}

+ (DateHelper *)sharedDateHelper
{
    static DateHelper *dateHelper = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        dateHelper = [[self alloc] init];
    });
    [dateHelper defaultSet];
    
    return dateHelper;
}

- (void) defaultSet
{
    self.dateFormatDH = @"YYYY-MM-dd HH:mm:ss";
    self.timeZoneDH = @"Asia/Shanghai";
}

- (NSDateFormatter *) dateFormatter
{
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:[DateHelper sharedDateHelper].dateFormatDH]; //hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:[DateHelper sharedDateHelper].timeZoneDH];
    [formatter setTimeZone:timeZone];
    
    return formatter;
}

- (NSDate *) dateFromString:(NSString *) dateString
{
    return [[[DateHelper sharedDateHelper] dateFormatter] dateFromString:dateString];;
}

- (NSString *) stringFromDate:(NSDate *) date
{
    return [[[DateHelper sharedDateHelper] dateFormatter] stringFromDate:date];
}

- (NSTimeInterval) timestampFromString:(NSString *) dateString
{
    return [[[DateHelper sharedDateHelper] dateFromString:dateString] timeIntervalSince1970];
}

- (NSString *) stringFromTimestamp:(NSTimeInterval) timeInterval
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return [[[DateHelper sharedDateHelper] dateFormatter] stringFromDate:date];;
}

@end
