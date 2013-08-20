//
//  OneViewController.m
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-4-16.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSMutableArray *) getBlockArray
{
    NSMutableArray *arr = [[NSMutableArray array] retain];
    
    GCDBlock b0 = ^{ NSLog(@"无序并发: 0"); sleep(3); }; [arr addObject:b0];
    GCDBlock b1 = ^{ NSLog(@"无序并发: 1"); }; [arr addObject:b1];
    GCDBlock b2 = ^{ NSLog(@"无序并发: 2"); }; [arr addObject:b2];
    GCDBlock b3 = ^{ NSLog(@"无序并发: 3"); }; [arr addObject:b3];
    GCDBlock b4 = ^{ NSLog(@"无序并发: 4"); }; [arr addObject:b4];
    GCDBlock b5 = ^{ NSLog(@"无序并发: 5"); }; [arr addObject:b5];
    GCDBlock b6 = ^{ NSLog(@"无序并发: 6"); }; [arr addObject:b6];
    GCDBlock b7 = ^{ NSLog(@"无序并发: 7"); }; [arr addObject:b7];
    GCDBlock b8 = ^{ NSLog(@"无序并发: 8"); }; [arr addObject:b8];
    GCDBlock b9 = ^{ NSLog(@"无序并发: 9"); }; [arr addObject:b9];
    GCDBlock b10 = ^{ NSLog(@"无序并发: 10"); }; [arr addObject:b10];
    GCDBlock b11 = ^{ NSLog(@"无序并发: 11"); }; [arr addObject:b11];
    GCDBlock b12 = ^{ NSLog(@"无序并发: 12"); }; [arr addObject:b12];
    GCDBlock b13 = ^{ NSLog(@"无序并发: 13"); }; [arr addObject:b13];
    GCDBlock b14 = ^{ NSLog(@"无序并发: 14"); }; [arr addObject:b14];
    GCDBlock b15 = ^{ NSLog(@"无序并发: 15"); }; [arr addObject:b15];
    
    return arr;
}

//无序并发
- (IBAction)selector0:(id)sender
{
    [GCDHelper gcdBatchPerformBlocks:[self getBlockArray] finally:^{
        NSLog(@"一组有序并发完成");
    }];
    
//    NSLog(@"一组无序并发完成");
}


- (IBAction)selector100:(id)sender
{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [arr addObject:[NSMutableArray array]];
    }
    
    __block int i = 0;
    [GCDHelper gcdBatchPerformBlockWithData:arr maxConcurrentOperationCount:10 handleBlock:^(id object) {
        
        sleep(1);
        NSMutableArray *arr = (NSMutableArray *)object;
        [arr addObject:@(i)];
        i++;
    } finally:^(id object) {
        NSLog(@"arr:%@", object);
    }];
}

- (IBAction)selector1:(id)sender
{
    [GCDHelper gcdPerformBlockOnce:^{
        NSLog(@"别想让我执行第二次");
    }];
    NSLog(@"不执行～");
}

//异步／后台执行
- (IBAction)selector2:(id)sender
{
    [GCDHelper gcdPerformBlockAsynchronous:^{
        sleep(3);
         NSLog(@"全局队列执行完成");
    }];
    NSLog(@"全局队列执行，不影响主队列");
}

//后台执行，然后返回主线程
- (IBAction)selector3:(id)sender
{
    [GCDHelper gcdPerformBlockAsynchronous:^{
       
        for (int i = 0; i< 10; i++)
        {
            NSLog(@"全局队列执行: %d", i);
        }
        
    } finishOnMainQueue:^{
        NSLog(@"回到主队列");
    }];
}

//三种队列执行
- (IBAction)selector4:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            [GCDHelper gcdPerformBlockOnMainQueue:^{
                NSLog(@"主队列执行");
            } feature:PerformBlockFeatureUnchoke];
            break;
        }
        case 1:
        {
            [GCDHelper gcdPerformBlockOnGlobalQueue:^{
                NSLog(@"全局队列执行");
            } feature:PerformBlockFeatureUnchoke priority:GlobalQueuePriorityDefault];
            break;
        }
        case 2:
        {
            [GCDHelper gcdPerformBlockOnCustomQueue:^{
                NSLog(@"自创建队列执行");
            } feature:PerformBlockFeatureUnchoke name:@"com.abc.bcd"];
            break;
        }
            
        default:
            break;
    }
}

//延迟执行
- (IBAction)selector5:(id)sender
{
    NSLog(@"延迟 2s 执行");
    [GCDHelper gcdPerformBlock:^{
        NSLog(@"执行完毕");
    } onQueue:[GCDHelper gcdMainQueue] delaySecond:2];
}

@end
