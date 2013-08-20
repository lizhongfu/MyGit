//
//  TestViewController.m
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-3-22.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
{
    NSMutableArray *array5;
}

@end

@implementation TestViewController

- (void) dealloc
{
    [array5 release];
    
    [super dealloc];
}

- (id) init
{
    if (self = [super init]) {
         array5 = [[NSMutableArray array] retain];
    }
    
    return self;
}

- (void)aSelector:(id)sender
{
}

- (void)aSelector2:(id)sender
{

}

- (void) log:(id) sender
{
//    sender可以是数组的下标，times是数组的count，这样就知道数组中那个任务执行完成了
    if (sender != nil) {
        NSLog(@"log:%@", sender);
    }
}

- (void)aSelector1:(id)sender
{
   
}

- (void)aSelector3:(id)sender
{
    GCDHelper *h = [[GCDHelper alloc] init];
    [h gcdPerformBlockOnce:^{
        NSLog(@"gcdPerformBlockOnce");
    }];
}

- (void) aSelector4:(id)sender
{
    GCDBlock b1, b2, b3, b4;
    b1 = ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"group1");
    };
    
    b2 = ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"group2");
    };
    
    b3 = ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"group3");
    };
    
    b4 = ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"group last");
    };
    
    NSMutableArray *a = [NSMutableArray array];
    [a addObject:b1];
    [a addObject:b2];
    [a addObject:b3];
    
}



- (NSString *) aSelector5Selector:(id) sender //这个方法必须带一个参数
{  
    return [(NSString *)sender stringByAppendingString:@"b"];
}

- (void) aSelector5:(id)sender
{
    if ((array5 != nil) && ([array5 count] > 0))
    {
        [array5 removeAllObjects];
    }
    for (int i=0; i<100; i++) {
        NSString *str1 = [NSString stringWithFormat:@"a%d", i];
        [array5 addObject:str1];
    }
 
    GCDHelper *h = [[GCDHelper alloc] init];
    
    [h gcdHandleData:array5 delegate:self handleSelector:^(id object, size_t index){
        NSLog(@"aaaaaaa");
        [(NSString *)object stringByAppendingString:@"b"];
    } finallyBlock:^(id object){
        NSLog(@"%@", object);
    }];
}

- (void) loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


@end
