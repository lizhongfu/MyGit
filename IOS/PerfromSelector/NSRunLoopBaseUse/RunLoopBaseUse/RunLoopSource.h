//
//  RunLoopSource.h
//  RunLoopBaseUse
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RunLoopSource.h"

@interface RunLoopSource : NSObject
{
    CFRunLoopSourceRef runLoopSource;
    NSMutableArray* commands;
}

- (id)init;
- (void)addToCurrentRunLoop;
- (void)invalidate;

// handler method
- (void)sourecFired;
// Client interface for registering commands to process
- (void)addCommand:(NSInteger)command withData:(id)data;
- (void)fireAllCommandsOnRunLoop:(CFRunLoopRef)runLoop;

@end

// These are the CFRunLoopSourceRef callback functions.
void RunLoopSourceScheduleRoutine (void *info, CFRunLoopRef rl, CFStringRef mode);
void RunLoopSourcePerformRoutine (void *info);
void RunLoopSourceCancelRoutine (void *info, CFRunLoopRef rl, CFStringRef mode);