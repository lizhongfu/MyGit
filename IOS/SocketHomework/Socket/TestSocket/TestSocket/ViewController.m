//
//  ViewController.m
//  TestSocket
//
//  Created by 李 忠福 on 13-8-15.
//  Copyright (c) 2013年 Lucky. All rights reserved.
//

#import "ViewController.h"

#define LittleToBig(A) ((((short int)(A)&0xff00)>>8) | (((short int)(A)&0x00ff)<<8))

AsyncUdpSocket *asyncUdpSocket;

@interface ViewController ()

@property (nonatomic, retain) AsyncUdpSocket *updSocket;

@end

@implementation ViewController
@synthesize updSocket;

//首先建立基于UDP的Socket连接  AsyncUdpSocket *updSocket
-(void)openUDPServer{
    
    NSString *bcHost = @"";
    NSString *anyHost = @"0.0.0.0";
    
    int UDP_SOCKET_PORT =         9080;
    int DISCOVERY_PORT  =       6003;
    
    updSocket = [[AsyncUdpSocket alloc] initWithDelegate:self];
    
    
    if([updSocket bindToAddress:@"user.api.kalagame.com" port:9080 error:nil])
    {
        NSLog(@"bind success");
    } else
    {
        NSLog(@"bind fail");
    }
    
    [updSocket enableBroadcast:YES error:nil];
    [updSocket receiveWithTimeout:10 tag:0];
    [updSocket sendData:[@"Hello" dataUsingEncoding:NSASCIIStringEncoding] toHost:bcHost port:UDP_SOCKET_PORT withTimeout:-1 tag:0];
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self sendMessage:@"HelloScoket"];
}

//连接建好后处理相应send Events
-(void)sendMessage:(NSString*)message
{
    NSMutableString *sendString = [NSMutableString stringWithCapacity:100];
    [sendString appendString:message];
    
//    
//    NSMutableData* sendPack = [[NSMutableData alloc]initWithCapacity:50];
//    NSData *devicename =  [[[UIDevice currentDevice] name] dataUsingEncoding:NSUTF8StringEncoding];
//    short Length = [devicename length] + 8;
//    Length = LittleToBig(Length);
//    NSData *nsdata_Length=[NSData dataWithBytes:&Length length:sizeof(Length)];
//    
//    [sendPack appendBytes:[nsdata_Length bytes] length:2];
//    [sendPack appendBytes:"\x00\x70" length:2];
//    [sendPack appendBytes:"\x00\x00\x00\x00" length:4];
//    [sendPack appendBytes:"\x00\x04" length:2];
//    [sendPack appendBytes:"\x01\x01" length:2];//设备类型 101表示IOS设备
//    [sendPack appendData:devicename];
//    [self.updSocket sendData:sendPack toHost:@"255.255.255.255" port:8000 withTimeout:-1 tag:0];
    
    
    //开始发送
    BOOL res = [self.updSocket sendData:[sendString dataUsingEncoding:NSUTF8StringEncoding]
                                 toHost:@"user.api.kalagame.com"
                                   port:9080
                            withTimeout:-1
                                    tag:0];
    
    NSLog(@"%@",sendString);
    if(res)
    {
        NSLog(@"xxxxffff");
    }
    else {
        NSLog(@"error");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    updSocket = [[AsyncUdpSocket alloc] initWithDelegate:self];
    if([updSocket bindToAddress:@"user.api.kalagame.com" port:9080 error:nil])
    {
        NSLog(@"bind success");
    } else
    {
        NSLog(@"bind fail");
    }
    
    [updSocket receiveWithTimeout:-1 tag:22];
}

-(BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port
{
    NSLog(@"onUdpSocket successful");
    //已经处理完毕  do something
    return YES;
}

-(void)onUdpSocket:(AsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error
{
    //无法发送时,返回的异常提示信息  do something
    NSLog(@"error1");
}

-(void)onUdpSocket:(AsyncUdpSocket *)sock didNotReceiveDataWithTag:(long)tag dueToError:(NSError *)error
{
    //无法接收时，返回异常提示信息   do something
    NSLog(@"error2");
}



//- (void) SendUdpData
//{
////    NSMutableData* sendPack = [[NSMutableData alloc]initWithCapacity:50];
////    NSData *devicename =  [[[UIDevice currentDevice] name] dataUsingEncoding:NSUTF8StringEncoding];
////    short Length = [devicename length] + 8;
////    Length = LittleToBig(Length);
////    NSData *nsdata_Length=[NSData dataWithBytes:&Length length:sizeof(Length)];
////    
////    [sendPack appendBytes:[nsdata_Length bytes] length:2];
////    [sendPack appendBytes:"\x00\x70" length:2];
////    [sendPack appendBytes:"\x00\x00\x00\x00" length:4];
////    [sendPack appendBytes:"\x00\x04" length:2];
////    [sendPack appendBytes:"\x01\x01" length:2];//设备类型 101表示IOS设备
////    [sendPack appendData:devicename];
////    [asyncUdpSocket sendData:sendPack toHost:@"255.255.255.255" port:8000 withTimeout:-1 tag:0];
////    [sendPack release];
//}
//
//- (BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port
//{
//    NSLog(@"onUdpSocket");
////    NSInteger len = [data length];
////    Byte *byteData = (Byte*)malloc(len);
////    memcpy(byteData, [data bytes], len);
////    NSMutableString *tvname = [[[NSMutableString alloc] initWithCapacity:0]autorelease];
////    NSMutableString *tversion = [[[NSMutableString alloc] initWithCapacity:0]autorelease];
////    NSMutableString *tvtype = [[[NSMutableString alloc] initWithCapacity:0]autorelease];
////    //OutLog(@"udp receive len:%d", len);
////    //if (*(byteData+2)==0x80 && *(byteData+3)==0x70)
////    if (![host isEqualToString:[UIDevice localWiFiIPAddress]] && (port == 8000))
////    {
////        //IP地址数组为空时有数据就加
////        if ([allIPArray count] == 0)
////        {
////            if (len>12)
////            {
////                [tversion setString:@""];
////                for (int i=9; i < 10; i++)
////                {
////                    [tversion appendFormat:@"%x", byteData[i]];
////                }
////                //OutLog(@" tversion = %@, invalue=%d", tversion, [tversion intValue]);
////                TVersion = [tversion intValue];
////                
////                //接收到UDP包设备类型，2ff为电视
////                [tvtype setString:@""];
////                for (int i = 10; i < 12; i ++)
////                {
////                    [tvtype appendFormat:@"%x", byteData[i]];
////                }
////                //OutLog(@" tvtype = %@, invalue=%d", tvtype, [tvtype intValue]);
////                
////                if ([tversion intValue] < 3 || [tversion isEqualToString:(NSString *)@"01ff"]) {
////                    OutLog(@"OLD Version");
////                } else if ([tversion intValue] == 3)
////                {
////                    OutLog(@"NEW Version");
////                }
////                
////                [tvname setString:@""];
////                
////                for (int i=12; i < len; i++)
////                {
////                    //OutLog(@"1 byte[%d] = %c", i, *(byteData+i));
////                    [tvname appendFormat:@"%c", byteData[i]];
////                }
////                //OutLog(@"1 tvname = %@, host=%@", tvname, host);
////                
////                if ([tvtype isEqualToString:@"2ff"])
////                {
////                    [allIPArray addObject:host];
////                    [g_tvnameIPDic setObject:tvname forKey:host];
////                    //OutLog(@"This Konka TV");
////                }
////            }
////            free(byteData);
////            return NO;
////        }
////        if (![allIPArray containsObject:host])
////        {
////            if (len>12)
////            {
////                //接收到UDP包设备类型，2ff为电视
////                [tvtype setString:@""];
////                for (int i = 10; i < 12; i ++)
////                {
////                    [tvtype appendFormat:@"%x", byteData[i]];
////                }
////                //OutLog(@" tvtype = %@, invalue=%d", tvtype, [tvtype intValue]);
////                
////                [tvname setString:@""];
////                for (int i=12; i < len; i++)
////                {
////                    //OutLog(@"2 byte[%d] = %c", i, *(byteData+i));
////                    [tvname appendFormat:@"%c", byteData[i]];
////                }
////                if ([tvtype isEqualToString:@"2ff"])
////                {
////                    [allIPArray addObject:host];
////                    [g_tvnameIPDic setObject:tvname forKey:host];
////                }
////            }
////        }
////    }
////    free(byteData);
////    [ipVC freshen];
//    return NO;
//}
//
////连接成功后
//- (void)onSocket:(AsyncUdpSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
//{
////    OutLog(@"Main thread(%@),onSocket:%p didConnectToHost:%@ port:%hu", [[NSThread currentThread] name], sock, host, port);
//    NSLog(@"Main thread(%@),onSocket:%p didConnectToHost:%@ port:%hu", [[NSThread currentThread] name], sock, host, port);
//    
//    // 等待数据接收
//    [sock readDataWithTimeout:-1 tag:0];
//}
//
//- (void)onUdpSocket:(AsyncUdpSocket *)sock didNotReceiveDataWithTag:(long)tag dueToError:(NSError *)error
//{
//    
//}
//
////向电视请求业务模块
////NSMutableData* modedata = [[NSMutableData alloc]initWithCapacity:4];
////[modedata appendBytes:"\x00\x00\x30\x02" length:4];
////[g_AsyncSocket writeData:modedata withTimeout:-1 tag:0];
////[modedata release];
////发数据一般就这么写的
//
////得到重力感应参数并发送给电视
//-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
////    float sensitivity = 12.0f;
////    self.x = acceleration.y * (-sensitivity);
////    self.y = acceleration.x * sensitivity;
////    self.z = acceleration.z * sensitivity;
////    
////    NSMutableData* data = [[NSMutableData alloc]initWithCapacity:12];
////    [data appendBytes:"\x00\x08\x10\x0b" length:4];
////    
////    short disx;
////    disx = LittleToBig(self.x);
////    NSData *nsdata_x=[NSData dataWithBytes:&disx length:sizeof(disx)];
////    
////    short disy;
////    disy = LittleToBig(self.y);
////    NSData *nsdata_y=[NSData dataWithBytes:&disy length:sizeof(disy)];
////    
////    short disz;
////    disz = LittleToBig(self.z);
////    NSData *nsdata_z=[NSData dataWithBytes:&disz length:sizeof(disz)];
////    
////    [data appendBytes:"\x00\x01" length:2];
////    [data appendBytes:[nsdata_x bytes] length:2];
////    [data appendBytes:[nsdata_y bytes] length:2];
////    [data appendBytes:[nsdata_z bytes] length:2];
////    [g_AsyncSocket writeData:data withTimeout:-1 tag:0];
////    
////    [self moveBoxWithX:self.x andY:self.y andZ:self.z];
////    OutLog(@"gsensor...........");
//}
////这个是得到整形怎么发给电视

@end
