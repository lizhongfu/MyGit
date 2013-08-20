//
//  GCDHelper.m
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-3-14.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "GCDHelper.h"

//Error
#define GCDHelperErrorURLISNULL   [NSError errorWithDomain:@"please setup GCDHelper‘s url or urlString" code:100 userInfo:nil]
#define GCDHelperErrorRequestISNULL  [NSError errorWithDomain:@"request can not be nil!" code:101 userInfo:nil]
#define GCDHelperErrorFileExist    [NSError errorWithDomain:@"File Exist!" code:102 userInfo:nil]
#define GCDHelperErrorCreateFail   [NSError errorWithDomain:@"Create File Fail!" code:103 userInfo:nil]

//下载的临时文件的后缀
#define kTHDownLoadTask_TempSuffix  @".TempDownload"
//计算下载速度的取样时间
#define kTHDownLoadTimerInterval  2.0
//THDispatchQueue默认的并发数
#define kTHDispatchQueueDefaultConcurrentCount 10

#define kDefaultTimeoutInterval  15


static NSString *kBoundaryStr=@"_insert_some_boundary_here_";

@implementation GCDHelper

@synthesize gcdHelperServiceBlock;

- (void) dealloc
{
    [_url              release];
    [_urlString        release];
    [_httpMethod       release];
    [_postDictionary   release];
    
    [super dealloc];
}

- (id) init
{
    if (self = [super init])
    {
        _timeoutInterval = -1;
    }
    
    return self;
}


#pragma mark -
#pragma mark 网络部分

@synthesize url                          = _url;
@synthesize urlString                    = _urlString;
@synthesize timeoutInterval              = _timeoutInterval;
@synthesize httpMethod                   = _httpMethod;
@synthesize postDictionary               = _postDictionary;

- (NSURL *) gcdURL
{
    if (!_url)
    {
        _url = [NSURL URLWithString:_urlString];
        return _url;
    }
    
    return _url;
}

- (NSString *) gcdHTTPMethod
{
    if (!_httpMethod || ![_httpMethod isEqualToString:@"POST"] || ![_httpMethod isEqualToString:@"GET"])
    {
        self.httpMethod = @"GET";
    }
    
    return _httpMethod;
}

- (NSURLRequest *) gcdRequest:(NSError **)error info:(NSData *) data
{
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:[self gcdURL]
															  cachePolicy:NSURLRequestUseProtocolCachePolicy
														  timeoutInterval:[self gcdTimeoutInterval]];
    if (!request)
    {
        if (error) *error = GCDHelperErrorRequestISNULL;
        return nil;
    }
    
    if ([[self gcdHTTPMethod] isEqualToString:@"POST"])
    {
        NSString *header_type = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",kBoundaryStr];
        [request addValue: header_type forHTTPHeaderField: @"Content-Type"];
        
        if (data != nil)
        {
            [request addValue:[NSString stringWithFormat:@"%d",[data length]] forHTTPHeaderField:@"Content-Length"];
        }
        
        [request setHTTPBody:data];
    }
    
	[request setHTTPMethod:[self gcdHTTPMethod]];
    return request;
}

- (NSDictionary *) gcdPostDictionary
{
    if (!_postDictionary)
    {
        self.postDictionary = [NSDictionary dictionary];
    }
    
    return _postDictionary;
}

- (NSTimeInterval) gcdTimeoutInterval
{
    if (_timeoutInterval < 0)
    {
        self.timeoutInterval = kDefaultTimeoutInterval;
    }

    return _timeoutInterval;
}

//将字典按照HTTP的协议进行编码
- (NSData*)gcdFormData:(NSDictionary*)dict
{
	NSString* boundary = [NSString stringWithString:kBoundaryStr];
	NSArray* keys = [dict allKeys];
	NSMutableData* result = [[NSMutableData alloc] init];
    
    NSStringEncoding  encoding = NSUTF8StringEncoding; //NSASCIIStringEncoding;
	for (int i = 0; i < [keys count]; i++)
	{
		id value = [dict valueForKey: [keys objectAtIndex: i]];
		[result appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:encoding]];
		if ([value isKindOfClass:[NSString class]])
		{
			[result appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", [keys objectAtIndex:i]] dataUsingEncoding:encoding]];
			[result appendData:[[NSString stringWithFormat:@"%@",value] dataUsingEncoding:encoding]];
		}
        if ([value isKindOfClass:[NSNumber class]])
		{
			[result appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", [keys objectAtIndex:i]] dataUsingEncoding:encoding]];
			[result appendData:[[value stringValue] dataUsingEncoding:encoding]];
		}
		else if ([value isKindOfClass:[NSURL class]] && [value isFileURL])
		{
			[result appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", [keys objectAtIndex:i], [[value path] lastPathComponent]] dataUsingEncoding:encoding]];
			[result appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:encoding]];
			[result appendData:[NSData dataWithContentsOfFile:[value path]]];
		}
        else if ([value isKindOfClass:[NSData class]])
        {
            [result appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", [keys objectAtIndex:i]] dataUsingEncoding:encoding]];
			[result appendData:value];
        }
		[result appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:encoding]];
	}
	[result appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:encoding]];
	
	return result;
}

- (void) startAsynGetMethod
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __block NSURLResponse  *response = nil;
        __block NSError *error = nil;
        __block NSData *receiveData = nil;
        NSURLRequest *request = [self gcdRequest:&error info:nil];
        
        if (error || (request == nil))
        {
            NSAssert(1, [GCDHelperErrorRequestISNULL localizedDescription]);
        }
       
        receiveData = [[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error] retain];
        
        if (self.gcdHelperServiceBlock)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.gcdHelperServiceBlock(response, error, receiveData);
            });
        }
        
        [request release];
    });
}

- (void) startAsynPostMethod
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __block NSURLResponse  *response = nil;
        __block NSError *error = nil;
        __block NSData *receiveData = nil;
        
        NSData *postData=[self gcdFormData:[self gcdPostDictionary]];
        NSURLRequest *request = [self gcdRequest:&error info:postData];
        
        if (request)
        {
            receiveData = [[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error] retain];
        }
        if (self.gcdHelperServiceBlock)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.gcdHelperServiceBlock(response, error, receiveData);
            });
        }
        
        [request release];
    });
}

- (void)gcdRequestNetWithBlock:(GCDServiceBlock) block
{
    self.gcdHelperServiceBlock = block;
    
    if ([[self gcdHTTPMethod] isEqualToString:@"GET"])
    {
        [self startAsynGetMethod];
    } else
    {
        [self startAsynPostMethod];
    }
}

#pragma mark -
#pragma mark 主队列延迟时间执行某方法

- (void) gcdPerformBlockOnMainQueue:(GCDBlock) block delaySecond:(int64_t) second
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, second * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

#pragma mark -
#pragma mark 全局队列异步执行
- (void) gcdPerformBlockOnGlobalQueue:(GCDBlock) block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

#pragma mark -
#pragma mark 全局队列延迟时间执行方法

- (void) gcdPerformBlockOnGlobalQueue:(GCDBlock) block delaySecond:(int64_t) second
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, second * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

#pragma mark -
#pragma mark 同步批量并发执行

- (void) gcdBatchPerformSelector:(SEL) selector delegate:(id) delegate times:(size_t) times
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_apply(times, queue, ^(size_t i) {
        if ([delegate respondsToSelector:selector]) {
            [delegate performSelector:selector withObject:[NSString stringWithFormat:@"%zd", i]];
        }
    });
    
    dispatch_release(queue);
}

#pragma mark -
#pragma mark 一次性执行

- (void) gcdPerformBlockOnce:(GCDBlock) block
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, block);
}

#pragma mark -
#pragma mark 按条件并发，最后汇总

/*
 *不仅所有数组元素都会被平行操作，后续的操作也会异步执行，并且这些异步运算都会将程序的其他部分的负载考虑在内。
 */

- (void) gcdPerformBlocks:(NSArray *) blocks finallyBlock:(GCDBlock) finallyBlock finallyOnMainQueue:(BOOL) onMainQueue
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();

    for (int i = 0; i < [blocks count]; i++)
    {
        GCDBlock aBlock = [blocks objectAtIndex:i];
        
        dispatch_group_async(group, queue, aBlock);
    }
    
    if (onMainQueue)
        dispatch_group_notify(group, dispatch_get_main_queue(), finallyBlock);
    else
        dispatch_group_notify(group, queue, finallyBlock);
    
    dispatch_release(group);
}

- (void) gcdHandleData:(NSArray *) dataArray delegate:(id) delegate handleSelector:(GCDBlock2) handleyBlock finallyBlock:(GCDBlock1) finallyBlock
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    for(int i = 0; i < [dataArray count]; i++)
    {
        dispatch_group_async(group, queue, ^{
            handleyBlock([dataArray objectAtIndex:i], i);
        });
    }
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    dispatch_release(group);
    dispatch_async(dispatch_get_main_queue(), ^{
        finallyBlock(dataArray);
    });
}

- (void) methods
{    
    

//    dispatch_barrier_async的使用:dispatch_barrier_async是在前面的任务执行结束后它才执行，而且它后面的任务等它执行完成之后才会执行
//    dispatch_queue_t queue6 = dispatch_queue_create("gcdtest.rongfzh.yc", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue6, ^{
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"dispatch_async1");
//    });
//    dispatch_async(queue6, ^{
//        [NSThread sleepForTimeInterval:4];
//        NSLog(@"dispatch_async2");
//    });
//    dispatch_barrier_async(queue6, ^{
//        NSLog(@"dispatch_barrier_async");
//        [NSThread sleepForTimeInterval:4];
//        
//    });
//    dispatch_async(queue6, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"dispatch_async3");
//    });
}

//For example, here is a function which transforms a data object containing ASCII data into an NSString using dispatch_data_apply to avoid unnecessary copies:
//NSString *StringFromDispatchData(dispatch_data_t data)
//{
//    NSMutableString *s = [NSMutableString stringWithCapacity: dispatch_data_get_size(data)];
//    dispatch_data_apply(data, ^(dispatch_data_t region, size_t offset, const void *buffer, size_t size) {
//        [s appendFormat: @"%.*s", size, buffer];
//        return (_Bool)true;
//    });
//    return s;
//}

@end


