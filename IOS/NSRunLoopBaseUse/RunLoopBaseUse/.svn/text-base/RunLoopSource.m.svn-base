//
//  RunLoopSource.m
//  RunLoopBaseUse
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RunLoopSource.h"


void RunLoopSourceScheduleRoutine (void *info, CFRunLoopRef rl, CFStringRef mode)

{
    RunLoopSource* obj = (RunLoopSource*)info;
    RunLoopContext* theContext = [[RunLoopContext alloc] initWithSource:obj andLoop:rl];
    [obj performSelector:@selector(registerSource:) withObject:theContext];
}


void RunLoopSourcePerformRoutine (void *info)

{
    RunLoopSource* obj = (RunLoopSource*)info;
    [obj sourceFired];
}

void RunLoopSourceCancelRoutine (void *info, CFRunLoopRef rl, CFStringRef mode)

{
    RunLoopSource* obj = (RunLoopSource*)info;
    RunLoopContext* theContext = [[RunLoopContext alloc] initWithSource:obj andLoop:rl];
    [obj performSelectorOnMainThread:@selector(removeSource:) withObject:theContext waitUntilDone:YES];
}

@implementation RunLoopSource

//安装输入源到Run Loop－－－分两步首先初始化一个输入源，然后将这个输入源添加到当前Run Loop里面
// List 3-7 Installing the run loop source
- (id)init
{
    /*
     // Setup the context.
     context.version = 0;
     context.info = self;
     context.retain = NULL;
     context.release = NULL;
     context.copyDescription = CFCopyDescription;
     context.equal = CFEqual;
     context.hash = CFHash;
     context.schedule = RunLoopSourceScheduleRoutine;
     context.cancel = RunLoopSourceCancelRoutine;
     context.perform = RunLoopSourcePerformRoutine;
     */
    CFRunLoopSourceContext context = {0, self, NULL, NULL, NULL, NULL, NULL,
        &RunLoopSourceScheduleRoutine,
        &RunLoopSourceCancelRoutine,
        &RunLoopSourcePerformRoutine};
    runLoopSource = CFRunLoopSourceCreate(NULL, 0, &context);
    commands = [[NSMutableArray alloc] init];
    return self;
}

- (void)addToCurrentRunLoop
{
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    //Add the new CFRunLoopSourceRef to the indicated runloop, 并且回调RunLoopSourceScheduleRoutine函数
    CFRunLoopAddSource(runLoop, runLoopSource, kCFRunLoopDefaultMode);
}

- (void)fireAllCommandsOnRunLoop:(CFRunLoopRef)runLoop
{
    //当手动调用此方法的时候，将会触发 RunLoopSourceContext的performCallback
    CFRunLoopSourceSignal(runLoopSource);
    CFRunLoopWakeUp(runLoop);
}

- (void)createAndScheduleTimerToRunLoopUsingNSTimer
{
    // get the current run loop
    NSRunLoop *myRunLoop = [NSRunLoop currentRunLoop];
    
    // create and schedule the first timer  === 可以配置到不同的run loop模式
    NSDate *futureDate = [NSDate dateWithTimeIntervalSinceNow:1.0];
    NSTimer *myTimer = [[NSTimer alloc] initWithFireDate:futureDate interval:0.1 target:self selector:@selector(myDoFireTimer1:) userInfo:nil repeats:YES];
    [myRunLoop addTimer:myTimer forMode:NSDefaultRunLoopMode];
    
    // create and schedule the second timer === 只能在run loop的NSDefaultRunLoopMode下有效
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(myDoFireTimer2:) userInfo:nil repeats:YES];
}

// Listing 3-11 Creating and scheduling a timer using Core Foundation
- (void)createAndScheduleTimerToRunLoopUsingCFRunLoopTimerRef
{
    // get the current run loop
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    CFRunLoopTimerContext context = {0, NULL, NULL, NULL, NULL};
    CFRunLoopTimerRef timer = CFRunLoopTimerCreate(kCFAllocatorDefault, 0.1, 0.3, 0, 0, &myCFTimerCallBack, &context);
    
    // add the CFRunLoopTimerRef to run loop kCFRunLoopCommonModes mode
    CFRunLoopAddTimer(runLoop, timer, kCFRunLoopCommonModes);
}

@end
