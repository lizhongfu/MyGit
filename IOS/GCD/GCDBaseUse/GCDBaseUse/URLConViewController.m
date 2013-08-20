//
//  URLConViewController.m
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-4-16.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "URLConViewController.h"

typedef struct _INT
{
    int t1;
    
}INT_STRUCT;

@interface URLConViewController ()
{
    NSMutableData *receivedData;
    BOOL finished;
}

@end

@implementation URLConViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        receivedData = [[NSMutableData data] retain];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) cleanText
{
    label.text = @"";
}

- (IBAction)segmentAction:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            [self sendRequestSync];
            break;
        }
        case 1:
        {
            [self sendRequestAsync];
            break;
        }
        case 2:
        {
            [self sendRequestAsyncOther];
            break;
        }
        case 3:
        {
            [self gcdRequest];
            break;
        }
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark  GCDRequest

- (void) gcdRequest
{
    GCDHelper *hp = [GCDHelper new];
    
    [hp gcdHttpRequestWithURL:@"http://localhost:8888/test.php"
                   httpMethod:GCDHelperHttpRequestMethodGET
                       params:[NSDictionary dictionary]
                      timeout:5.0f
                      success:^(NSURLResponse *response, NSError *error, NSData *data) {
                          if (data && (!error))
                          {
                              label.text = [[data objectFromJSONData] description];
                          }
                          
                      }
                         fail:^(NSURLResponse *response, NSError *error, NSData *data) {
                             if (error)
                             {
                                 label.text = [error description];
                             }
                         }];
}

#pragma mark -
#pragma mark  sendRequestSync

- (void) sendRequestSync
{
    [self cleanText];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL:[NSURL URLWithString:@"http://localhost:8888/test.php"]];
    [request setHTTPMethod:@"GET"];
    
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:nil
                                                     error:&error];
    
    if (data && (!error))
    {
        label.text = [[data objectFromJSONData] description];
    }
}

#pragma mark -
#pragma mark  sendRequestAsync

- (void) sendRequestAsync
{
    finished = NO;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://localhost:8888/test1.php"]];
    [request setHTTPMethod:@"GET"];
    [request setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    [request setTimeoutInterval:5.0f];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
                                                                  delegate:self
                                                          startImmediately:YES];
    
    [connection start];
    
//    但是异步模式下带来了一个新的问题，很多情况下，网络请求不在主线程，或者界面等待网络结果，不在主线程的时候，调用线程如果生命周期over，下面这些可能都没有调用到，导致得不到想要得效果，所以需要在NSURLConnection请求后面加点东西来阻塞
    while(!finished) {
        
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
    }
}

// 收到回应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // 注意这里将NSURLResponse对象转换成NSHTTPURLResponse对象才能去
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    
    if ([response respondsToSelector:@selector(allHeaderFields)])
    {
        NSDictionary *dictionary = [httpResponse allHeaderFields];
        NSLog(@"allHeaderFields: %@",dictionary);
    }
    [receivedData setLength:0];
}

// 接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"get some data");
    [receivedData appendData:data];
}

// 数据接收完毕
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *results = [[NSString alloc] initWithBytes:[receivedData bytes]
                                                 length:[receivedData length]
                                               encoding:NSUTF8StringEncoding];
    
    label.text = [[results objectFromJSONString] description];
    
    finished = YES;
}

// 返回错误
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed: %@", error);
}

#pragma mark -
#pragma mark  sendRequestAsyncOther

- (IBAction) sendRequestAsyncOther
{
    [self cleanText];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://localhost:8888/test2.php"]];
    [request setHTTPMethod:@"GET"];
    [request setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    [request setTimeoutInterval:5.0f];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue new]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   label.text = [[data objectFromJSONData] description];
                               });
                               
                           }];
}

@end
