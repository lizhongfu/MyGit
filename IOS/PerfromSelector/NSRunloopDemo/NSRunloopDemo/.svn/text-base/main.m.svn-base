//
//  main.m
//  NSRunloopDemo
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

static void _perform(void *info __unused)
{
    printf("hello\n");
}

static void _timer(CFRunLoopTimerRef timer __unused, void *info)
{
    CFRunLoopSourceSignal(info);
}

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
//        CFRunLoopSourceRef source;
//        
//        CFRunLoopSourceContext source_context;
//        
//        CFRunLoopTimerRef timer;
//        
//        CFRunLoopTimerContext timer_context;
//        
//        
//        
//        bzero(&source_context, sizeof(source_context));
//        
//        source_context.perform = _perform;
//        
//        source = CFRunLoopSourceCreate(NULL, 0, &source_context);
//        
//        CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopCommonModes);
//        
//        
//        
//        bzero(&timer_context, sizeof(timer_context));
//        
//        timer_context.info = source;
//        
//        timer = CFRunLoopTimerCreate(NULL, CFAbsoluteTimeGetCurrent(), 1, 0, 0, _timer, &timer_context);
//        
//        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes);
//        
//        CFRunLoopRun();
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
