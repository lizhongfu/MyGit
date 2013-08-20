//
//  RootViewController.m
//  NSMachPortDemo
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void) loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	[self lanchThread];
}

// 配置NSMachPort对象－－－本地线程间通信，通过传递端口对象变量进行端口间通讯
- (void)lanchThread
{
//    A线程（父线程）创建NSMachPort对象，并加入A线程的run loop。
    
    NSPort *myPort = [NSPort port];
    if(myPort)
    {
        // This class handles incoming port message
        [myPort setDelegate:self];
        
        // install the port as an input source
        [[NSRunLoop currentRunLoop] addPort:myPort forMode:NSDefaultRunLoopMode];
        
//        当创建B线程（辅助线程）时，将创建的NSMachPort对象传递到主体入口点，B线程（辅助线程）就可以使用相同的端口对象将消息传回A线程（父线程）。
        
        [NSThread detachNewThreadSelector:@selector(LaunchThreadWithPort:)
                                 toTarget:[MyWorkerThread class]
                               withObject:myPort];
    }
}


#pragma mark
#define kCheckinMessage     100
#pragma mark NSPortDelegate Method

//===NSPort是通过代理模式传送消息，下面这段代码是NSPortDelegate的代理方法，用以从B线程回传消息（(NSPortMessage *)message）
//B线程NSMachPort）端口传递消息给A线程的（NSPort）端口（handlePortMessage代理方法）

- (void)handlePortMessage:(NSPortMessage*)portMessage
{
    NSLog(@"NSPortMessage:%@", portMessage);
    
//    uint32_t message = [portMessage msgid];
//    NSPort* distantPort = nil;
//    
//    if (message == kCheckinMessage)
//    {
//        distantPort = [portMessage sendPort];
//        [self storeDistantPort:distantPort];
//    }
//    else
//    {
//        // Handle other messages.
//    }
}

@end
