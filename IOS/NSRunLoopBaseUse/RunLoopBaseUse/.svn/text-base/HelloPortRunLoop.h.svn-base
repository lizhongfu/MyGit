//
//  HelloPortRunLoop.h
//  RunLoopBaseUse
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyWorkerClass : NSObject <NSMachPortDelegate>
{
}

+ (void) LaunchThreadWithPort:(id)inData;
- (void) sendCheckinMessage:(NSPort*)outPort;
- (BOOL) shouldExit;

@end

@interface HelloPortRunLoop : NSObject<NSMachPortDelegate> {
    
}

- (void) launchThread;

@end

/*
 1. NSPort源
 我们在上一章讲过，NSPort源有3种类型：NSMachPort, NSMessagePort 和 NSSocketPort, 而NSMessagePort已经不被推荐使用， 在iOS 5中，NSMessagePort只是一个空的对象了，所以我们只会讲解NSMachPort 和 NSSocketPort
 */