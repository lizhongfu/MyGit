//
//  SocketHelper.h
//  TestSocket
//
//  Created by Zogful.Lee on 13-8-18.
//  Copyright (c) 2013年 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketHelper : NSObject

//初始话，创建socket
- (id) init;

//发送数据
-(void)writeDataOnMainThread:(id)string;

//打开
- (NSInteger)socketOpen:(NSString*)addr port:(NSInteger)port;

//写数据
- (NSInteger)socketWrite:(NSString*)cmd level:(NSInteger)level;

//关闭
- (NSInteger)socketClose;

@end
