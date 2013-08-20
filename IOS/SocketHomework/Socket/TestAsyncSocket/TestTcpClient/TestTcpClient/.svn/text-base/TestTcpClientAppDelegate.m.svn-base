//
//  TestUdpClientAppDelegate.m
//  TestUdpClient
//
//  Created by Xie Wei on 11-6-5.
//  Copyright 2011年 e-linkway.com. All rights reserved.
//

#import "TestTcpClientAppDelegate.h"
#import "AsyncUdpSocket.h"
#import "AsyncSocket.h"

#define SERVER_IP    @"user.api.kalagame.com"
#define SERVER_PORT  9080

#define LittleToBig(A) ((((short int)(A)&0xff00)>>8) | (((short int)(A)&0x00ff)<<8))

@implementation TestUdpClientAppDelegate


@synthesize window = _window;
@synthesize sendSocket = _sendSocket;

- (NSMutableData *) getData
{
    NSMutableData* sendPack = [[NSMutableData alloc]initWithCapacity:50];
//    NSData *devicename =  [[[UIDevice currentDevice] name] dataUsingEncoding:NSUTF8StringEncoding];
//    short Length = [devicename length] + 8;
//    Length = LittleToBig(Length);
//    NSData *nsdata_Length=[NSData dataWithBytes:&Length length:sizeof(Length)];
    
//    [sendPack appendBytes:[nsdata_Length bytes] length:16];
    [sendPack appendBytes:"1" length:16];
    [sendPack appendBytes:"0" length:16];
    [sendPack appendBytes:"\x00\x04" length:2];
    [sendPack appendBytes:"\x01\x01" length:2];//设备类型 101表示IOS设备

    return sendPack;
}

//发送短消息
-(IBAction)sendString
{    
    NSMutableData *data = [self getData];

    static BOOL connectOK = NO;

    if (!_sendSocket)
    {
        self.sendSocket = [[[AsyncSocket alloc] initWithDelegate: self] autorelease];

        NSError *error;
        connectOK = [_sendSocket connectToHost: SERVER_IP onPort: SERVER_PORT error: &error];

        if (!connectOK)
        {
            NSLog(@"connect error: %@", error);
        }

        [_sendSocket setRunLoopModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
    }

    if (connectOK) 
    {
        //发送数据
        [_sendSocket writeData:data withTimeout: -1 tag: 0];
    }
}

- (void) test
{
    NSString *testString = @"1234567890";
    NSData *testData = [testString dataUsingEncoding: NSUTF8StringEncoding];
    Byte *testByte = (Byte *)[testData bytes];
    
    for(int i=0;i<[testData length];i++){
        printf("testByte = %d\n",testByte[i]);
    }
        
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    float button_center_y = 20;
    float button_center_offset = 50;

    _sendButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    _sendButton.frame = CGRectMake(0, 0, 200, 30);
    _sendButton.center = CGPointMake(320 / 2, button_center_y += button_center_offset);
    [_sendButton addTarget: self action: @selector(sendString) forControlEvents: UIControlEventTouchUpInside];
    [_sendButton setTitle: @"Send String" forState: UIControlStateNormal];
    [self.window addSubview: _sendButton];

    [self.window makeKeyAndVisible];
    
    [self test];

    return YES;
}

#pragma mark - tcp


- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
	NSLog(@"%s %d host:%@ port:%d", __FUNCTION__, __LINE__, host, port);

    //这是异步返回的连接成功
    [_sendSocket readDataWithTimeout: -1 tag: 0];
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    NSLog(@"%s %d, tag = %ld", __FUNCTION__, __LINE__, tag);

    //这是异步返回的连接成功
    [_sendSocket readDataWithTimeout: -1 tag: 0];
}

// 这里必须要使用流式数据 接收Socket数据
- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSString *msg = [[[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding] autorelease];

    NSLog(@"%s %d, msg = %@", __FUNCTION__, __LINE__, msg);

    //这是异步返回的连接成功
    [_sendSocket readDataWithTimeout: -1 tag: 0];
}

- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    NSLog(@"%s %d, err = %@", __FUNCTION__, __LINE__, err);
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    NSLog(@"%s %d", __FUNCTION__, __LINE__);

    self.sendSocket = nil;
}


#pragma mark -

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
