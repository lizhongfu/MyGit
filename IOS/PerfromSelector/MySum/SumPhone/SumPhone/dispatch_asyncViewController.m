//
//  dispatch_asyncViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "dispatch_asyncViewController.h"

#define kBgQueue dispatch_get_global_queue("com.myapp.network", 0)


@interface dispatch_asyncViewController ()

@end

@implementation dispatch_asyncViewController

+ (NSString *)friendlyName {
    return @"dispatch_queue_t使用";
}

- (void) loadData {
    
    //    创建一个新queue队列的代码
    //    Dispatch Queues从使用的角度将更象另一种形式的Operation Queues只是 Operation Queuse是用ObjectC的Dispatch Queues是C的
    dispatch_queue_t network_queue;
    network_queue = dispatch_queue_create("myQueue", NULL);
    
    dispatch_async(network_queue, ^{
        printf("Do some work here.\n");
    });
    
    printf("The first block may or may not have run.\n");
    
    dispatch_sync(network_queue, ^{
        printf("Do some more work here.\n");
    });
    printf("Both blocks have completed.\n");
    
    
//    //    dispatch_async会向kBgQueue队列中添加新的任务去执行
//    dispatch_async(network_queue, ^{
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"www.baidu.com"]];
//        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
//    } );
//    
//    
//   // 回到主线程    
//   dispatch_async(dispatch_get_main_queue(), ^{    
//      // 显示图片到界面    
//      [self displayImageToTableView:nil];
//   });
    
    //    还有一种就是Concurrent Queues每个程序系统自动提供了3个Concurrent Queues，啥意思一看就明白，3个优先级别的concurrent queues
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t aHQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t aLQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //    [self loadData];
    
    
    //    但是我们的应用不是简单的同步也异步的运行，应用经常是混合的
    //    比如我们要task1 task2 task3 都运行完成后才能异步运行task4 task5 task6我们该怎么做呢？这里我们可以引入group的概念
    
//    [self projectLoadData];
    
    
    //    有时候我们也可以将设定一个数据在queue中 也可以定义一个结束函数
    //    dispatch_set_finalizer_f 是在dispatch_release时候被调用
    [self projectLoadDataWithFinishMethod];
}

- (void) projectLoadData {
    dispatch_queue_t aDQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    // Add a task to the group
    dispatch_group_async(group, aDQueue, ^{
        printf("task 1 \n");
    });
    
    dispatch_group_async(group, aDQueue, ^{
        printf("task 2 \n");
    });
    
    dispatch_group_async(group, aDQueue, ^{
        printf("task 3 \n");
    });
    
    printf("wait 1 2 3 \n");
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    printf("task 1 2 3 finished \n");
    dispatch_release(group);
    group = dispatch_group_create();
    // Add a task to the group
    dispatch_group_async(group, aDQueue, ^{
        printf("task 4 \n");
    });
    dispatch_group_async(group, aDQueue, ^{
        printf("task 5 \n");
    });
    dispatch_group_async(group, aDQueue, ^{
        printf("task 6 \n");
    });
    
    printf("wait 4 5 6 \n");
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    printf("task 4 5 6 finished \n");
    dispatch_release(group);
}

//为队列提供一个clean up 函数。
void myFinalizerFunction(void *context)   {
    printf("task myFinalizerFunction \n");
}

- (void) projectLoadDataWithFinishMethod {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.example.CriticalTaskQueue", NULL);
    if (serialQueue)
    {
        dispatch_set_context(serialQueue, self);
        dispatch_set_finalizer_f(serialQueue, &myFinalizerFunction);
    }
    
    dispatch_group_t group = dispatch_group_create();
    
    // Add a task to the group
    dispatch_group_async(group, serialQueue, ^{
        printf("task 1 \n");
    });
    
    dispatch_group_async(group, serialQueue, ^{
        printf("task 2 \n");
    });
    
    dispatch_group_async(group, serialQueue, ^{
        printf("task 3 \n");
    });
    printf("wait 1 2 3 \n");
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);  
    dispatch_release(group);
    dispatch_release(serialQueue);
}

@end
