//
//  SocketHelper.m
//  TestSocket
//
//  Created by Zogful.Lee on 13-8-18.
//  Copyright (c) 2013年 Lucky. All rights reserved.
//

#import "SocketHelper.h"

#define theEndTag 255

@interface SocketHelper ()
{
    AsyncSocket *_sock;
}

@end

@implementation SocketHelper

//初始话，创建socket
- (id) init
{
    if (self = [super init])
    {
        _sock = [[AsyncSocket alloc] initWithDelegate:self];
        [_sock setRunLoopModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
    }
    
    return self;
}

//发送数据
-(void)writeDataOnMainThread:(id)string
{
    NSData *cmdData = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    //AsyncSocket  writeData    方法来发送数据，它有如下定义
    [_sock writeData:cmdData withTimeout:-1 tag:0];
}

//打开
- (NSInteger)socketOpen:(NSString*)addr port:(NSInteger)port
{
    if (![_sock isConnected])
    {
        NSError *err = nil;
        [_sock connectToHost:addr onPort:port withTimeout:-1 error:&err];
        NSLog(@"connect to Host:%@ Port:%d", @"user.api.kalagame.com", 9080);
    }
    
    return 0;
}

//写数据
- (NSInteger)socketWrite:(NSString*)cmd level:(NSInteger)level
{
    if ([_sock isConnected])
    {
        //处理发送数据，加入队列等待发送
    }
    else
    {
        NSLog(@"Offline!");
    }
    
    return 0;
}

//关闭
- (NSInteger)socketClose
{
    if ([_sock isConnected])
    {
        NSData *xmlData = [@"close socket" dataUsingEncoding:NSUTF8StringEncoding]; 
        [_sock writeData:xmlData withTimeout:-1 tag:theEndTag];
        [_sock disconnectAfterReadingAndWriting];
    }
    
    return 0;
}

#pragma mark -
#pragma mark Delegate

- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    kPrintInfo(err)
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    kPrintInfo(@"")
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    kPrintInfo(@"")
    //这是异步返回的连接成功，
    [sock readDataWithTimeout:-1 tag:0];
}

// 接收Socket数据
- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    kPrintInfo(@"")
    
    NSString *msg = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    if(msg)
    {
        //处理受到的数据
        NSLog(@"%@", msg);
    }
    else
    {
        NSLog(@"Error converting received data into UTF-8 String");
    }
    
    [sock readDataWithTimeout:-1 tag:0];
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    kPrintInfo(@"")
    
    NSLog(@"didWriteDataWithTag:%d",tag);
}

@end
