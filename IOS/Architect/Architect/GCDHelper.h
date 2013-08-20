//
//  GCDHelper.h
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-3-14.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

/*
 *  Grand Central Dispatch (GCD)是Apple开发的一个多核编程的解决方法。
 *  系统要求：iOS4.0以上。
 */

#import <Foundation/Foundation.h>

typedef enum
{
    GCDHelperQueueTypeMain,
    GCDHelperQueueTypeGlobal,
    GCDHelperQueueTypeCustom
    
} GCDHelperQueueType;

typedef void (^GCDServiceBlock) (NSURLResponse *response, NSError *error, NSData *data);
typedef void (^GCDBlock) (void);
typedef void (^GCDBlock1) (id object1);
typedef void (^GCDBlock2) (id object1, size_t index);

@interface GCDHelper : NSObject
{
@private
    NSURL                  *_url;
    NSString               *_urlString;
    NSTimeInterval          _timeoutInterval;
    NSString               *_httpMethod;
    NSDictionary           *_postDictionary;
}

@property (nonatomic, retain) NSURL *url;
@property (nonatomic,   copy) NSString *urlString;
@property (nonatomic, assign) NSTimeInterval timeoutInterval;
@property (nonatomic,   copy) NSString *httpMethod;
@property (nonatomic, retain) NSDictionary *postDictionary;
@property (nonatomic,   copy) GCDServiceBlock gcdHelperServiceBlock;

//GCD请求网络（GET方式测试通过，POST方式测试未通过）
- (void) gcdRequestNetWithBlock:(GCDServiceBlock) block;

//主队列延迟时间执行某方法
- (void) gcdPerformBlockOnMainQueue:(GCDBlock) block delaySecond:(int64_t) second;

//全局队列异步执行
- (void) gcdPerformBlockOnGlobalQueue:(GCDBlock) block;

//全局队列延迟时间执行方法
- (void) gcdPerformBlockOnGlobalQueue:(GCDBlock) block delaySecond:(int64_t) second;

//同步批量并发执行，可以把各种任务放到数组里
- (void) gcdBatchPerformSelector:(SEL) selector delegate:(id) delegate times:(size_t) times;

//只执行一次
- (void) gcdPerformBlockOnce:(GCDBlock) block;

//按顺序执行一组，然后执行XX
- (void) gcdPerformBlocks:(NSArray *) blocks finallyBlock:(GCDBlock) finallyBlock finallyOnMainQueue:(BOOL) onMainQueue;

//无序的用一个办法处理一组数据，然后执行XX
- (void) gcdHandleData:(NSArray *) dataArray delegate:(id) delegate handleSelector:(GCDBlock2) handleyBlock finallyBlock:(GCDBlock1) finallyBlock;

@end
