//
//  BaseViewController.m
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-4-18.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//


#import "BaseViewController.h"

@implementation BaseViewController

- (void) dealloc
{
    dispatch_release(queue);
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        queue = dispatch_queue_create("sss", NULL);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) longTask:(id) sender
{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 1000; i++) {
        
        [arr addObject:[NSMutableArray arrayWithObject:@(i)]];
        NSLog(@"longTask:%d", i);
    }
}

- (void) longTaskOther:(id) sender
{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 10000; i++) {
        
        [arr addObject:[NSMutableArray arrayWithObject:@(i)]];
        NSLog(@"longTaskOther:%d", i);
    }
}

- (IBAction) calculate:(id)sender
{
    field3.text = [NSString stringWithFormat:@"%f", [field1.text floatValue] - [field2.text floatValue]];
}
- (IBAction) operationQueue:(id)sender;
{
    NSOperationQueue *aqueue = [NSOperationQueue new];
    NSInvocationOperation *operation = [[NSInvocationOperation alloc]
                                        initWithTarget:self
                                        selector:@selector(longTask:)
                                        object:nil];
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc]
                                        initWithTarget:self
                                        selector:@selector(longTaskOther:)
                                        object:nil];
    

    [aqueue addOperation:operation];
    [aqueue addOperation:operation1];
    
    [operation release];
    [operation1 release];
}
- (IBAction) gcd:(id)sender  //3.192999
{
    [GCDHelper gcdPerformBlockAsynchronous:^{
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i < 1000; i++) {
            
            [arr addObject:[NSMutableArray arrayWithObject:@(i)]];
            NSLog(@"longTask:%d", i);
        }
    }];
    
    [GCDHelper gcdPerformBlockAsynchronous:^{
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i < 10000; i++) {
            
            [arr addObject:[NSMutableArray arrayWithObject:@(i)]];
            NSLog(@"longTaskOther:%d", i);
        }
    }];
}

//////////////////////////////////////////////////////

- (IBAction)notchoke:(id)sender
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"qqq");
    });

    NSLog(@"不阻塞");
}


//Calls to dispatch_sync() targeting the current queue will result
//* in dead-lock. Use of dispatch_sync() is also subject to the same
//* multi-party dead-lock problems that may result from the use of a mutex.
//* Use of dispatch_async() is preferred.
//在当前队列上调用dispatch_sync() 会导致死锁。调用dispatch_sync()，并使用mutex 经常会导致多方死锁问题。
- (IBAction) choke:(id)sender
{
    dispatch_queue_t exampleQueue;
    
    int i = 3;
    switch (i) {
        case 0:
            exampleQueue = dispatch_get_global_queue(0, 0);
            break;
        case 1:
            exampleQueue = dispatch_queue_create("com.abc.xxx", NULL);
            break;
        case 2:
            exampleQueue = dispatch_get_current_queue();
            break;
        case 3:
            exampleQueue = dispatch_get_main_queue();
            break;
            
        default:
            exampleQueue = dispatch_get_global_queue(0, 0);
            break;
    }
    
    dispatch_sync( exampleQueue,^{
        [self longTask:nil];
    });
    
    NSLog(@"task finish");
}

- (IBAction) getUIData:(id)sender
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        __block NSString *stringValue;
        dispatch_sync(dispatch_get_main_queue(), ^{
            stringValue = [textField.text copy];
        });
        
        [stringValue retain];
        
        NSLog(@"stringValue:%@", stringValue);
    });
}



//一个要注意的地方是，dispatch queue的挂起是block粒度的。换句话说，挂起一个queue并不会将当前正在执行的block挂起。它会允许当前执行的block执行完毕，然后后续的block不再会被执行，直至queue被恢复。
//还有一个注意点：从man页上得来的：如果你挂起了一个queue或者source，那么销毁它之前，必须先对其进行恢复。
- (IBAction)startQueue:(id)sender
{
    dispatch_async(queue, ^{
        for (int i = 0; i < 10000; i++) {
            NSLog(@"taskA");
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10000; i++) {
            NSLog(@"taskB");
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10000; i++) {
            NSLog(@"taskC");
        }
    });
}
- (IBAction)suspendQueue:(id)sender
{
    NSLog(@"Queue suspend");
    dispatch_suspend(queue);

}
- (IBAction)resumeQueue:(id)sender
{
    NSLog(@"Queue resume");
    dispatch_resume(queue);

}

@end
