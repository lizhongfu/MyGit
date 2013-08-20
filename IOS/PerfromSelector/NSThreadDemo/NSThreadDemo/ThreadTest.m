//
//  ThreadTest.m
//  NSThreadDemo
//
//  Created by Zogful.Lee on 13-4-3.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ThreadTest.h"

@interface ThreadTest ()
{
    int          tickets;
    int          count;
    NSThread    *ticketsThreadone;
    NSThread    *ticketsThreadtwo;
    NSCondition *ticketsCondition;
    
    NSCondition *_myCondition;
    int _threadCount;
}

@end

@implementation ThreadTest

- (void)dealloc
{
    [ticketsThreadone release];
    [ticketsThreadtwo release];
    [ticketsCondition release];

    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
         _myCondition = [[NSCondition alloc]init]; 
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)btAction:(id)sender
{
    tickets =100;
    count =0;
    
    // 锁对象
    ticketsCondition = [[NSCondition alloc]init];
    
    ticketsThreadone = [[NSThread alloc] initWithTarget:self selector:@selector(run)object:nil];
    [ticketsThreadone setName:@"Thread-1"];
    [ticketsThreadone start];
    
    ticketsThreadtwo = [[NSThread alloc] initWithTarget:self selector:@selector(run)object:nil];
    [ticketsThreadtwo setName:@"Thread-2"];
    [ticketsThreadtwo start];
    //[NSThread detachNewThreadSelector:@selector(run) toTarget:selfwithObject:nil];
}

//“锁”为代码提供了“暴力”的保护方式，在同一时刻，代码只能被一个线程执行。其中，“互斥锁”是最常用的一种形式，也被叫做互斥体（mutex）。当一个线程试图获取被其他线程占用的互斥体时，该线程会被阻塞，直到互斥体被释放。几个系统框架提供对互斥体的支持，而它们都基于同样的底层技术。Cocoa提供额外的几种互斥体来支持不同的操作，比如递归操作。更多信息，请参考“Locks.” 
-(void)run{
    while (TRUE){
        // 上锁
        [ticketsCondition lock];
        if(tickets > 0)
        {
            [NSThread sleepForTimeInterval:0.5];
            count = 100 -tickets;
            
            NSThread *athread = [NSThread currentThread];
            NSLog(@"当前票数是:%d,售出:%d,线程名:%@",tickets, count, [athread name]);
            tickets--;
        }else
        {
            break;
        }
        [ticketsCondition unlock];
    } 
}

//////////////////////////////////

- (IBAction)btAction2:(id)sender
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3
                                                     target:self
                                                   selector:@selector(threadTester)
                                                   userInfo:nil 
                                                    repeats:NO];
    [timer fire];
}


//除了锁以外，系统支持条件控制。它可以保证程序中任务按照正确的顺序执行。条件控制就像一个“门卫”，它会一直阻塞某个线程。直到特定的条件为真，才允许线程继续执行。POSIX层和Foundatoin框架都直接支持条件控制。（如果你使用操作对象（operation object），你可以设置它们之间的依赖关系，从而起到设置任务操作顺序的目的，这和条件控制很类似）。
-(void)threadTester
{
    [_myCondition lock];
    
    _threadCount = -2;
    //如果有n个要等待的thread，这里置成 -n
    [_myCondition unlock];
    //
    NSLog(@"");
    NSLog(@"------------------------------------------------------------------------------");
    
//    三个线程都可以开始，但是按顺序完成的
    [NSThread detachNewThreadSelector:@selector(threadOne  ) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(threadTwo  ) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(threadThree) toTarget:self withObject:nil];
    
    return; 
}

//线程1 和 线程2 哪个先开始就先处理完哪个线程，然后依次处理其余线程。

-(void)threadOne
{
    NSLog(@"@@@threadOne 开始");
    
    [_myCondition lock];
    
    NSLog(@"@@@threadOne 即将休眠2秒 :%d", _threadCount);
    sleep(2); //[NSThreadsleepForTimeInterval:n];
    
    _threadCount++ ;
    NSLog(@"@@@threadOne 已经完成2秒休眠 :%d", _threadCount);
    
    [_myCondition signal];
    NSLog(@"@@@threadOne signal :%d", _threadCount);
    
    [_myCondition unlock];
    NSLog(@"@@@threadOne 完成");
    
    [NSThread exit];
    
    return;
}

-(void)threadTwo
{
    NSLog(@"###threadTwo 开始");
    
    [_myCondition lock];
    
    NSLog(@"###threadTwo 即将休眠3秒 :%d", _threadCount);
    sleep(3); //  [NSThreadsleepForTimeInterval:n];
    
    _threadCount++ ;
     NSLog(@"###threadTwo 已经完成3秒休眠 :%d", _threadCount);
    
    [_myCondition signal];
    NSLog(@"###threadTwo signal :%d", _threadCount);
    
    
    [_myCondition unlock];
    NSLog(@"###threadTwo 完成");
    
    [NSThread exit];
    
    return;
}
-(void)threadThree
{
    NSLog(@"<<<threadThree 开始");
    
    [_myCondition lock];
    
    while(_threadCount < 0){
        [_myCondition wait];
    }
    
    NSLog(@"<<<In thread 333333 ,_threadCount now is %d ,will startwork.",_threadCount);
    
    
    [_myCondition unlock]; 
    NSLog(@"<<<In thread 333333complete.");
    
    [NSThread exit]; 
    return; 
}

@end
