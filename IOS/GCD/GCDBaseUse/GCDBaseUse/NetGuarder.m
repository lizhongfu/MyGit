//
//  NetGuarder.m
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-4-18.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "NetGuarder.h"

@implementation NetGuarder

static NetGuarder *guarder = nil;

+ (void) getNetConnectMsg
{
    GCDHelper *hp = [GCDHelper new];
    [hp gcdNetWorkGuarder:@"www.baidu.com" withBlock:^(BOOL flag) {
        if (flag)
        {
            NSLog(@"Net connect");
        } else
        {
            NSLog(@"Net not connect");
        }
    }];
}

+ (NetGuarder *) shareNetGuarder
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        NSLog(@"单例创建");
        guarder = [[self alloc] init];
        
        [NetGuarder getNetConnectMsg];
    });
    
    return guarder;
}

@end
