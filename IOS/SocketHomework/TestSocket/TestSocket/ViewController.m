//
//  ViewController.m
//  TestSocket
//
//  Created by 李 忠福 on 13-8-16.
//  Copyright (c) 2013年 Lucky. All rights reserved.
//

#import "ViewController.h"

#define SERVER_IP    @"user.api.kalagame.com"
#define SERVER_PORT  9080

@interface ViewController ()

@property (nonatomic, retain)AsyncUdpSocket  *sendSocket;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createudpgetip];
}

- (void) SendUdpData
{
    const char buf[] = "\x00\x04\x00\x70\x00\x00\x01\x01";
    NSData* sendPack = [NSData dataWithBytes:buf length:8];
    BOOL ok = [asyncUdpSocket sendData:sendPack toHost:@"255.255.255.255" port:8000 withTimeout:-1 tag:0];
    NSLog(@"SendUdpData ok =%d", ok);
}

- (void) createudpgetip
{
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
    
    asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
    [asyncSocket setRunLoopModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
    NSMutableData *data = [[NSMutableData alloc]initWithCapacity:5];
    [data appendBytes:"\x00\x01\x01\x03" length:4];
    [data appendBytes:"\x41" length:1];
    [asyncSocket writeData:data withTimeout:-1 tag:0];
}

- (IBAction)sendData:(id)sender
{
    NSString * string = @"R/103";
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];

    BOOL ok = [self.sendSocket sendData:data toHost:SERVER_IP port:SERVER_PORT withTimeout:-1 tag:0];

    NSLog(@"SendUdpData ok =%d", ok);
}

/**
 * Called when the datagram with the given tag has been sent.
 **/
- (void)onUdpSocket:(AsyncUdpSocket *)sock didSendDataWithTag:(long)tag {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void) onUdpSocket:(AsyncUdpSocket*)sock didReceiveData:(NSData*)data withTag:(long)tag fromHost:(NSString*)host port:(UInt16)port
{
    NSInteger len = [data length];
    Byte *byteData = (Byte*)malloc(len);
    memcpy(byteData, [data bytes], len);
    if (*(byteData+2)==0x80 && *(byteData+3)==0x70)
    {
        NSLog(@"1 onUdpSocket host =%@, port = %d", host, port);
        //        NSLog(@"byteData=%0x", *(byteData+i));
    }
    NSLog(@"received data: %@",[[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]);
}

#pragma mark - tcp

//开启监听
- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
	NSLog(@"%s %d host:%@ port:%d", __FUNCTION__, __LINE__, host, port);
    
    [asyncSocket readDataWithTimeout: -1 tag: 0];
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    NSLog(@"%s %d, tag = %ld", __FUNCTION__, __LINE__, tag);
    
    [asyncSocket readDataWithTimeout: -1 tag: 0];
}

// 连接成功，打开监听数据读取，如果不监听那么无法读取数据
- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSString *msg = [[[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding] autorelease];
    
    NSLog(@"%s %d, msg = %@", __FUNCTION__, __LINE__, msg);
    
    [asyncSocket readDataWithTimeout: -1 tag: 0];
}

- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    NSLog(@"%s %d, err = %@", __FUNCTION__, __LINE__, err);
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
    
    asyncSocket = nil;
}

@end
