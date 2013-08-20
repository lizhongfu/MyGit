//
//  SignalViewController.m
//  NSThreadDemo
//
//  Created by Zogful.Lee on 13-4-3.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "SignalViewController.h"

@interface SignalViewController ()
{
   
}

@end

@implementation SignalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    NSThread* myThread = [[NSThread alloc] initWithTarget:self selector:@selector(testSyncWithoutDupLock) object:nil];
//    [myThread start ];
    
    NSThread* myThread2 = [[NSThread alloc] initWithTarget:self selector:@selector(testSyncWithDupLock) object:nil];
    [myThread2 start ];
}

-(void)testSyncWithDupLock{//正确的使用方法
    NSCondition* lock2=[[NSCondition alloc] init];
    [lock2 lock];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSLog(@"testSyncWithDupLock: working in a queue");
        NSLog(@"2:lock condition");
        [lock2 lock];
        NSLog(@"2:sign condition");
        [lock2 signal];
        [lock2 unlock];
    });
    NSLog(@"2:sleep 1 second");
    [NSThread sleepForTimeInterval:1];
    
    NSLog(@"2:wait for event");
    [lock2 wait];
    
    NSLog(@"2:wait done.");
    [lock2 unlock];
}

-(void)testSyncWithoutDupLock{//这个是有错误的同步实现。
    NSCondition* lock1=[[NSCondition alloc]init];
    [lock1 lock];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSLog(@"working in a queue");
        [lock1 signal];//signal之前得先lock
        NSLog(@"signal in another thread done.");
    });
    NSLog(@"sleep 1 second");
    [NSThread sleepForTimeInterval:1];
    NSLog(@"wait for event");
    [lock1 wait];// 在概率上，这句会在上面的[lock1 signal]之后执行，会导致永远无法返回。
    NSLog(@"wait for event done");// unreachable code here.
    [lock1 unlock];
    
}



@end
