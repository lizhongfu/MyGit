//
//  HelloPortRunLoop.m
//  RunLoopBaseUse
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "HelloPortRunLoop.h"

#define kCheckinMessage 100 

@implementation MyWorkerClass

- (BOOL) shouldExit
{
    return YES;
}

+(void)LaunchThreadWithPort:(id)inData
{
    NSAutoreleasePool*  pool = [[NSAutoreleasePool alloc] init];
    NSPort* distantPort = (NSPort*)inData;
    
    MyWorkerClass*  workerObj = [[self alloc] init];
    [workerObj sendCheckinMessage:distantPort];
    
    [distantPort release];
    
    do
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate distantFuture]];
    }
    while (![workerObj shouldExit]);
    
    [workerObj release];
    [pool release];
}

- (void)handleMachMessage:(void *)msg
{
    NSLog(@"MyWorkerClass: handle mach message");
}

- (void)sendCheckinMessage:(NSPort*)outPort
{
    //[self setRemotePort:outPort];
    NSPort* myPort = [NSMachPort port];
    [myPort setDelegate:self];
    [[NSRunLoop currentRunLoop] addPort:myPort forMode:NSDefaultRunLoopMode];
    
//    一旦NSRunLoop有了这个port，就可以往port里面发消息了
    [outPort sendBeforeDate:[NSDate distantFuture] msgid:kCheckinMessage components:nil from:myPort reserved:0];
    
    
//     NSPortMessage* messageObj = [[NSPortMessage alloc] initWithSendPort:outPort
//     receivePort:myPort components:nil];
//     
//     if (messageObj)
//     {
//     [messageObj setMsgId:kCheckinMessage];
//     [messageObj sendBeforeDate:[NSDate date]];
//     }  
}

@end

@implementation HelloPortRunLoop

- (void)handleMachMessage:(void *)msg
{
    NSLog(@"HelloPortRunLoop:handle mach message");
}


 - (void)handlePortMessage:(NSPortMessage*)portMessage
 {
 uint32_t message = [portMessage msgid];
 NSPort* distantPort = nil;
 
 if (message == kCheckinMessage)
 {
 distantPort = [portMessage sendPort];
 [self storeDistantPort:distantPort];
 }
 else
 {
 // Handle other messages.
 }
 }

- (void) launchThread
{
    NSPort* myPort = [NSMachPort port];
    if (myPort)
    {
        [myPort setDelegate:self];
        [[NSRunLoop currentRunLoop] addPort:myPort forMode:NSDefaultRunLoopMode];
        
        [NSThread detachNewThreadSelector:@selector(LaunchThreadWithPort:) toTarget:[MyWorkerClass class] withObject:myPort];
    }
}

@end


