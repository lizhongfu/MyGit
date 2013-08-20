//
//  ViewController.m
//  PerfromSelector
//
//  Created by Zogful.Lee on 13-4-2.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ViewController.h"

#import "NSObjectEx.h"
#import "AsynInvoke.h"

NSTimer *paintingTimer;

//不在主线程里不能执行
//dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//    
//    [self performSelector:@selector(test:) withObject:@"1" afterDelay:2];
//
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1
//                                             target:self
//                                           selector:@selector(test:)
//                                           userInfo:nil
//                                            repeats:YES];
//    
//    NSRunLoop *rl = [NSRunLoop currentRunLoop];
//    [rl addTimer:timer forMode:NSDefaultRunLoopMode];
//});



//主线程中执行，这个方法有说头啊
//[self performSelectorOnMainThread:@selector(test:) withObject:@"1" waitUntilDone:YES];


@implementation ViewController

- (void) invokeMethod:(id) sender
{
    NSLog(@"invokeMethod");
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self method];
}

- (void) paint:(id) sender
{
    NSLog(@"paint");
}

- (void) startPainting
{
    SEL selectorToCall = @selector(paint:);
    NSMethodSignature *methodSignature =[[self class] instanceMethodSignatureForSelector:selectorToCall];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    
    [invocation setTarget:self];
    [invocation setSelector:selectorToCall];
    NSTimer *newTimer = [NSTimer timerWithTimeInterval:1.0
                                            invocation:invocation
                                               repeats:YES];
    paintingTimer = newTimer;
    [[NSRunLoop currentRunLoop] addTimer:paintingTimer
                                 forMode:NSDefaultRunLoopMode];
}

- (void)test:(id) sender
{
    sleep(3);
    NSLog(@"%@", sender);
}

- (void)test2:(id) sender : (id) sender1
{
    NSLog(@"%@ - %@", sender, sender1);
}

- (void)test3:(id) sender : (id) sender1 : (id) sender2
{
    NSLog(@"%@ - %@ - %@", sender, sender1, sender2);
}

- (IBAction)btAction:(id)sender
{
    
//    [self startPainting];
    
//    if ([paintingTimer isValid])
//    {
//        [self startPainting];
////        [paintingTimer invalidate];
//    } else{
//        [paintingTimer fire];
//    }
    
    AsynInvoke *as = [[AsynInvoke alloc] init];
    [as method:@"1"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSRunLoop mainRunLoop];
    });
}

@end
