//
//  MyWorkerThread.m
//  NSMachPortDemo
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "MyWorkerThread.h"

#define kCheckinMessage 100

@implementation MyWorkerThread

- (BOOL) shouldExit
{
    return YES;
}

//＝＝＝下面是辅助线程的类方法，里面创建了辅助线程实例，并把传入的NSPort保存下来。同时，通过NSMachPort发送一个Check－In Message（NSPortMessage类型，在这个Message类型中设置了SendPort/ReceivePort，链接这两个端口）给A线程
+(void)LaunchThreadWithPort:(id)inData
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    // Set up the connection between this thread and the main thread.
    NSPort* distantPort = (NSPort*)inData;
    
    MyWorkerThread* workerObj = [[self alloc] init];
    [workerObj sendCheckinMessage:distantPort];
    [distantPort release];
    
    // Let the run loop process things.
    do
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate distantFuture]];
    }
    while (![workerObj shouldExit]);
    
    [workerObj release];
    [pool release];
}

- (void)sendCheckinMessage:(NSPort *)outPort
{
    NSPort* myPort = [NSMachPort port];
    [myPort setDelegate:self];
    [[NSRunLoop currentRunLoop] addPort:myPort forMode:NSDefaultRunLoopMode];
    
    //    一旦NSRunLoop有了这个port，就可以往port里面发消息了
    [outPort sendBeforeDate:[NSDate distantFuture] msgid:kCheckinMessage components:nil from:myPort reserved:0];
}

@end
