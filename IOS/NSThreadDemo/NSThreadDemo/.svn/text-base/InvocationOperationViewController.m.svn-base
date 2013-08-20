//
//  InvocationOperationViewController.m
//  NSThreadDemo
//
//  Created by Zogful.Lee on 13-4-3.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "InvocationOperationViewController.h"

@interface InvocationOperationViewController ()
{
    NSOperationQueue *operationQueue;
    //在头文件中声明该队列
}

@end

@implementation InvocationOperationViewController

- (void) dealloc
{
    [operationQueue release];
    //正如Alan经常说的，我们是程序的好公民，需要释放内存！
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        operationQueue = [[NSOperationQueue alloc] init];//初始化操作队列
        [operationQueue setMaxConcurrentOperationCount:5];
        //在这里限定了该队列只同时运行一个线程
        //这个队列已经可以使用了
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction) btAction:(id) sender
{
    [NSThread detachNewThreadSelector:@selector(init_backup:)toTarget:self withObject:nil]; 
}
//可以通过performSelectorOhMainThread更新UI元素，比如设置进度条等等。最后消除loading画面，载入主View。

- (void) show_loading:(id) sender
{
    UIImageView *im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]];
    im.frame = CGRectMake(0, 0, 30, 30);
    
    [self.view addSubview:im];
}

-(void)init_backup:(id)sender
{
    NSAutoreleasePool *pool =[[NSAutoreleasePool alloc]init];
    
    [self performSelectorOnMainThread:@selector(show_loading:) withObject:nil waitUntilDone:NO];
    
    [pool release];
}


#pragma mark -
#pragma mark 多线程之NSInvocationOperation 

-(IBAction) launchTaskWithData
{
    //创建一个NSInvocationOperation对象，并初始化到方法
    //在这里，selector参数后的值是你想在另外一个线程中运行的方法（函数，Method）
    //在这里，object后的值是想传递给前面方法的数据
    
    for (int i = 0; i < 100; i++)
    {
        NSInvocationOperation* theOp = [[NSInvocationOperation alloc]
                                        initWithTarget:self
                                        selector:@selector(myTaskMethod:)
                                        object:@(i)];
        
        // 下面将我们建立的操作“Operation”加入到本地程序的共享队列中（加入后方法就会立刻被执行）
        // 更多的时候是由我们自己建立“操作”队列
        [operationQueue addOperation:theOp];
    }
}

// 这个是真正运行在另外一个线程的“方法”
-(void)myTaskMethod:(id)data
{
    NSLog(@"%@", data);
}

@end
//一个NSOperationQueue 操作队列，就相当于一个线程管理器，而非一个线程。因为你可以设置这个线程管理器内可以并行运行的的线程数量等等。下面是建立并初始化一个操作队列：
//简单介绍之后，其实可以发现这种方法是非常简单的。很多的时候我们使用多线程仅仅是为了防止主线程堵塞，而NSInvocationOperation就是最简单的多线程编程，在iPhone编程中是经常被用到的。
