//
//  HelloRunloop.m
//  RunLoopBaseUse
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "HelloRunloop.h"

void myRunLoopObserver(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info)
{
    switch (activity) {
            
        // The entrance of run loop, before entering the event processing loop.
        // This activity occurs once for each call to CFRunLoopRun / CFRunLoopRunInMode
        case kCFRunLoopEntry:   //通知观察者Run Loop已经启动
            NSLog(@"run loop entry");
            break;
            
        // Inside the event processing loop before any timers are processed
        case kCFRunLoopBeforeTimers:  //通知观察者任何即将要开始的定时器
            NSLog(@"run loop before timers");
            break;
        
        // Inside the event processing loop before any sources are processed
        case kCFRunLoopBeforeSources:   //通知观察者任何即将启动的非基于端口的输入源
            NSLog(@"run loop before sources");
            break;
            
        // Inside the event processing loop before the run loop sleeps, waiting for a source or timer to fire
        // This activity does not occur if CFRunLoopRunInMode is called with a timeout of o seconds
        // It also does not occur in a particular iteration of the event processing loop if a version 0 source fires
        case kCFRunLoopBeforeWaiting:   //启动任何准备好的非基于端口的源
            NSLog(@"run loop before waiting");
            break;
            
        // Inside the event processing loop after the run loop wakes up, but before processing the event that woke it up
        // This activity occurs only if the run loop did in fact go to sleep during the current loop
        case kCFRunLoopAfterWaiting:   //如果基于端口的源准备好了并处于等待状态，立即启动；并进入步骤9
            NSLog(@"run loop after waiting");
            break;
            
        // The exit of the run loop, after exiting the event processing loop
        // This activity occurs once for each call to CFRunLoopRun and CFRunLoopRunInMode
        case kCFRunLoopExit:   //Run Loop终止, 通知观察者线程进入休眠
            NSLog(@"run loop exit");
            break;
            /*
             A combination of all the preceding stages
             case kCFRunLoopAllActivities:
             break;
             */
            
        default:
            break;
    }
}

@implementation HelloRunloop

- (void) run:(id)arg
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    sleep(5);
    
    propTest0 = NO;
    
    [self performSelectorOnMainThread:@selector(wakeUpMainThreadRunloop:) withObject:nil waitUntilDone:NO];
    
    [pool release];
}

- (void) doFireTimer:(id) sender {
    NSLog(@"doFireTimer");
}

- (void)observerRunLoop {
    
    // 建立自动释放池
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 获得当前thread的Run loop
    NSRunLoop *myRunLoop = [NSRunLoop currentRunLoop];
    
    // 设置Run Loop observer的运行环境
    CFRunLoopObserverContext context = {0, self, NULL, NULL, NULL};
    
    // 创建Run loop observer对象
	// 第一个参数用于分配该observer对象的内存
	// 第二个参数用以设置该observer所要关注的的事件，详见回调函数myRunLoopObserver中注释
	// 第三个参数用于标识该observer是在第一次进入run loop时执行还是每次进入run loop处理时均执行
	// 第四个参数用于设置该observer的优先级
	// 第五个参数用于设置该observer的回调函数
	// 第六个参数用于设置该observer的运行环境
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities,
                                                            
                                                            YES, 0, &myRunLoopObserver, &context);
    
    
    if (observer) {
        
        // 将Cocoa的NSRunLoop类型转换程Core Foundation的CFRunLoopRef类型
        CFRunLoopRef cfRunLoop = [myRunLoop getCFRunLoop];
        
        // 将新建的observer加入到当前的thread的run loop
        CFRunLoopAddObserver(cfRunLoop, observer, kCFRunLoopDefaultMode);
    }
    
    // Creates and returns a new NSTimer object and schedules it on the current run loop in the default mode
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(doFireTimer:) userInfo:nil repeats:YES];
    
    NSInteger loopCount = 10;
    
//    确保RunLoop处理了输入源
    do {
        
        // 启动当前thread的run loop直到所指定的时间到达，在run loop运行时，run loop会处理所有来自与该run loop联系的input sources的数据
		// 对于本例与当前run loop联系的input source只有Timer类型的source
		// 该Timer每隔0.1秒发送触发时间给run loop，run loop检测到该事件时会调用相应的处理方法（doFireTimer:）
		// 由于在run loop添加了observer，且设置observer对所有的run loop行为感兴趣
		// 当调用runUntilDate方法时，observer检测到run loop启动并进入循环，observer会调用其回调函数，第二个参数所传递的行为时kCFRunLoopEntry
		// observer检测到run loop的其他行为并调用回调函数的操作与上面的描述相类似
        
        [myRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        
        // 当run loop的运行时间到达时，会退出当前的run loop，observer同样会检测到run loop的退出行为，并调用其回调函数，第二个参数传递的行为是kCFRunLoopExit.
        loopCount--;
    } while (loopCount);
    
    // 释放自动释放池
    [pool release];
}

- (void) wakeUpMainThreadRunloop:(id)arg
{
    NSLog(@"wakeup main thread runloop.");
}

//在新线程的Run Loop中注册Observers
- (IBAction)start:(id)sender
{
    propTest0 = YES;
    //[NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(observerRunLoop) toTarget:self withObject:nil];
    
    propTest1 = @"waiting";
    
//    确保RunLoop处理了输入源
    while (propTest0)
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }  
    
    propTest1 = @"end";  
}

@end
