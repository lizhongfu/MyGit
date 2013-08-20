//
//  Table.m
//  NSThreadDemo
//
//  Created by Zogful.Lee on 13-4-3.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "Table.h"

@interface Table ()
{
    CFRunLoopRef audioRunLoop;
}

@end



@implementation Table

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height+70);
    self.clearsSelectionOnViewWillAppear = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.section];
    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sTitle = @"";
    switch (section) {
        case 0:
            sTitle = @"为NSThread创建一个run loop";
            break;
        case 1:
            sTitle = @"线程的堆栈大小";
            break;
        case 2:
            sTitle = @"多线程之NSInvocationOperation";
            break;
        case 3:
            sTitle = @"利用iphone的多线程实现和线程同步";
            break; 
        case 4:
            sTitle = @"signal 的使用";
            break;
        case 5:
            sTitle = @"Apple's OpenCL——多线程同步";
            break;
        case 6:
            sTitle = @"NSXMLDocument";
            break;
        default:
            break;
    }
    
    return sTitle;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            [self beginThread1];
            break;
        case 1:
            [self threadSize];
            break;
        case 2:
            [self invocationOperation];
            break;
        case 3:
            [self threadOperation];
            break;
        case 4:
            [self signalUse];
            break;
        case 5:
            [self openCLMethod];
            break;
        case 6:
            [self NSXMLDocumentMethod];
            break;
        default:
            break;
    }
}

#pragma mark - 
#pragma mark NSThread & NSRunloop

- (void) beginThread1
{
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(playerThread:) object:nil];
    [thread1 start];
}

- (void) checkStatusersInfo:(id) sender
{
    static int i;
    if ((i++) < 5) {
        NSLog(@"RunLoop ...");
        return;
    }
    
    NSLog(@"RunLoop 停止");
    CFRunLoopStop(audioRunLoop);//结束子线程任务
}

- (void) initPlayer
{
    NSTimer *stateChange = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(checkStatusersInfo:) userInfo:nil repeats:YES];
    [stateChange fire];
}

//要设置一个运行回路，你所要做的只是运行你的线程，获得一个运行回路的对象，“安装”你的事件处理者，并且告诉运行回路去运行。不管是Cocoa还是Carbon都在主线程中自动为你提供了默认运行回路的设置。如果你需要创建一个长期存在的子线程，就需要自己来在线程里定义运行回路了。 
- (void) playerThread:(id) sender
{
    NSLog(@"RunLoop 开始");
    audioRunLoop = CFRunLoopGetCurrent();
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    [self initPlayer];
    
    CFRunLoopRun();
    [pool drain];
}

#pragma mark -
#pragma mark 线程的堆栈大小

#include "pthread.h"

void *threadFunc(void *arg) {
    void*  stack_base = pthread_get_stackaddr_np(pthread_self());
    size_t stack_size = pthread_get_stacksize_np(pthread_self());
    NSLog(@"Thread: base:%p / size:%lu", stack_base, stack_size);
    return NULL;
}

- (void) threadSize {
    void*  stack_base = pthread_get_stackaddr_np(pthread_self());
    size_t stack_size = pthread_get_stacksize_np(pthread_self());
    struct rlimit limit;
    getrlimit(RLIMIT_STACK, &limit);
    NSLog(@"Main thread: base:%p / size:%lu", stack_base, stack_size);
    NSLog(@"  rlimit-> soft:%llu / hard:%llu", limit.rlim_cur, limit.rlim_max);
    
    pthread_t thread;
    pthread_create(&thread, NULL, threadFunc, NULL);
}

#pragma mark -
#pragma mark 多线程之NSInvocationOperation

- (void) invocationOperation
{
    NSLog(@"invocationOperation");
    InvocationOperationViewController *vc = [InvocationOperationViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark 多线程之NSInvocationOperation

- (void) threadOperation
{
    NSLog(@"threadOperation");
    ThreadTest *vc = [ThreadTest new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) signalUse
{
    SignalViewController *vc = [SignalViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark Apple's OpenCL——多线程同步

- (void) openCLMethod
{
    
}

#pragma mark -
#pragma mark Apple's OpenCL——多线程同步

- (void) NSXMLDocumentMethod
{
    XMLViewController *vc = [XMLViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
