//
//  MulthreadConcurrentVC.m
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-3-19.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "MulthreadConcurrentVC.h"

/*
 
 如何在GCD中快速的控制并发呢？答案就是
 dispatch_semaphore，对经常做unix开发的人来讲，我所介绍的内容可能就显得非常入门级了，信号量在他们的多线程开发中再平常不过了。
 在GCD中有三个函数是semaphore的操作，分别是：
 dispatch_semaphore_create          创建一个semaphore
 dispatch_semaphore_signal          发送一个信号
 dispatch_semaphore_wait              等待信号
 简单的介绍一下这三个函数，第一个函数有一个整形的参数，我们可以理解为信号的总量，dispatch_semaphore_signal是发送一个信号，自然会让信号总量加1，dispatch_semaphore_wait等待信号，当信号总量少于0的时候就会一直等待，否则就可以正常的执行，并让信号总量减少1，根据这样的原理，我们便可以快速的创建一个并发控制。
 
 */


/*
 
简单的介绍一下这一段代码，创建了一个初使值为10的semaphore，每一次for循环都会创建一个新的线程，线程结束的时候会发送一个信号，线程创建之前会信号等待，所以当同时创建了10个线程之后，for循环就会阻塞，等待有线程结束之后会增加一个信号才继续执行，如此就形成了对并发的控制，如上就是一个并发数为10的一个线程队列。
 
*/

@implementation MulthreadConcurrentVC

- (void) loadView
{
    [super loadView];
}

- (void)aSelector:(id)sender
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 100; i++)
    {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            sleep(2);
            dispatch_semaphore_signal(semaphore);
        });
    }
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    dispatch_release(group);
    dispatch_release(semaphore);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt.frame = CGRectMake(100, 100, 120, 120);
    [bt addTarget:self action:@selector(aSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}

@end
