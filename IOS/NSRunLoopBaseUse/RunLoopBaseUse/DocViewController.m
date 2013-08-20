//
//  DocViewController.m
//  RunLoopBaseUse
//
//  Created by Zogful.Lee on 13-2-9.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "DocViewController.h"
#import "HelloRunloop.h"
#import "HelloPortRunLoop.h"
#import "CustomInputSourceViewController.h"

@interface DocViewController ()

@end

@implementation DocViewController

//    1.NSRunLoop是消息机制的处理模式
- (void) content1
{
    NSLog(@"Run loops是线程的基础架构部分。一个run loop就是一个事件处理循环，用来不停的调配工作以及处理输入事件。使用run loop的目的是使你的线程在有工作的时候工作，没有的时候休眠。");
}

- (void) loadPageInBackground
{
    NSLog(@"loadPageInBackground");
}
- (void) content2
{
    [NSThread detachNewThreadSelector:@selector(loadPageInBackground) toTarget:self withObject:nil];
    [progress setHidden:NO];
    while (YES) {
        
        NSLog(@"loop start");
        [NSTimer scheduledTimerWithTimeInterval:1 target:nil selector:nil userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        
        NSLog(@"loop end");
    }
    [progress setHidden:YES];
}
//       [NSDate distantFuture] 指当前秒到当下一分钟的开始如
//        果当前是 17.24.21 则当前运行的时间为17.25.00 - 17.24.21 总39秒
//        如果当前是 15.12.01 则当前运行的时间为15.13.00 - 15.12.01 总59秒
//        每次NSRunloop都将运行1.0秒 [NSDate dateWithTimeIntervalSinceNow:1.0]


- (void) testAction3:(NSTimer *) timer
{
    NSLog(@"%d", [ORUserDefault getUserDefaultsInt:@"testAction3"]);
    
    int i = [ORUserDefault getUserDefaultsInt:@"testAction3"];
    
    if (i > 4)
    {
        [ORUserDefault setUserDefaultsInt:0 forKey:@"testAction3"];
        if (timer != nil)
        {
            [timer invalidate];
            timer = nil;
        }
    } else
    {
        ++i;
        [ORUserDefault setUserDefaultsInt:i forKey:@"testAction3"];
    }
}
- (void) content3
{
//    手动制定添加到自己新建的NSRunLoop的中
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(testAction3:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes ];
    [timer fire];
}


- (void) content4
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NSRunLoop" ofType:@"png"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    [web loadRequest:req];
    
    UIViewController *vc = [UIViewController new];
    [vc.view addSubview:web];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void) content5
{
    HelloRunloop *hr = [[HelloRunloop alloc] init];
    [hr start:nil];
}

- (void) content6
{
//    程序运行过程如下：
//    a. 在主线程中创建次线程， [lpr launchThread] 函数负责创建次线程: LaunchThreadWithPort:
//    b. 次线程给主线程发送check in消息: sendCheckinMessage.
//    c. 主线程获取消息: - (void)handleMachMessage:(void *)msg
    
    HelloPortRunLoop *hr = [[ HelloPortRunLoop alloc] init];
    [hr launchThread];
}

- (void) content7
{
    CustomInputSourceViewController *hr = [[[ CustomInputSourceViewController alloc] init] autorelease];
    [self.navigationController pushViewController:hr animated:YES];
}

- (void) content8
{
    
}

- (UIButton *) getButton:(NSString *) title selector:(SEL) selector frameY:(float) y
{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [bt setTitle:title forState:UIControlStateNormal];
    [bt addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    bt.frame = CGRectMake(10, y, 300, 40);
    
    return [bt retain];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIScrollView *scrollView = (UIScrollView *)self.view;
    scrollView.contentSize = CGSizeMake(320, 1000);
    
    UIButton *bt1 = [self getButton:@"Run Loop 与 线程" selector:@selector(content1) frameY:40];
    [self.view addSubview:bt1];
    [bt1 release];
    
    UIButton *bt2 = [self getButton:@"运行时循环" selector:@selector(content2) frameY:90];
    [self.view addSubview:bt2];
    [bt2 release];
    
    UIButton *bt3 = [self getButton:@"NSTimer 与 NSRunloop" selector:@selector(content3) frameY:140];
    [self.view addSubview:bt3];
    [bt3 release];
    
    UIButton *bt4 = [self getButton:@"NSRunLoop具体的工作原理" selector:@selector(content4) frameY:190];
    [self.view addSubview:bt4];
    [bt4 release];
   
    UIButton *bt5 = [self getButton:@"HelloRunLoop" selector:@selector(content5) frameY:240];
    [self.view addSubview:bt5];
    [bt5 release];
    
    UIButton *bt6 = [self getButton:@"HelloRunLoop" selector:@selector(content6) frameY:290];
    [self.view addSubview:bt6];
    [bt6 release];
    
    UIButton *bt7 = [self getButton:@"自定义输入源" selector:@selector(content7) frameY:340];
    [self.view addSubview:bt7];
    [bt7 release];
    
    UIButton *bt8 = [self getButton:@"" selector:@selector(content8) frameY:390];
    [self.view addSubview:bt8];
    [bt8 release];
}



- (void) testAction2
{
    NSLog(@"%@", [NSDate date]);
}

@end
