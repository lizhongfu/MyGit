//
//  AsynInvoke.m
//  PerfromSelector
//
//  Created by Zogful.Lee on 13-4-2.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "AsynInvoke.h"

@implementation AsynInvoke

- (id) init
{
    if (self = [super init])
    {
    }
    
    return self;
}

- (NSString *) invokeMethod:(id) sender
{
    NSLog(@"invokeMethod");
    
    return @"a";
}

- (void) method:(id) sender
{
    NSMethodSignature *sig=[[AsynInvoke class] instanceMethodSignatureForSelector:@selector(invokeMethod:)];
    
    //根据方法签名创建一个NSInvocation
    NSInvocation *invocation=[NSInvocation invocationWithMethodSignature:sig];
    
    //设置调用者也就是AsynInvoked的实例对象，在这里我用self替代
    [invocation setTarget:self];
    
    //设置被调用的消息
    [invocation setSelector:@selector(invokeMethod:)];
    
    //如果此消息有参数需要传入，那么就需要按照如下方法进行参数设置，需要注意的是，atIndex的下标必须从2开始。原因为：0 1 两个参数已经被target 和selector占用
    NSInteger num=10;
    [invocation setArgument:&num atIndex:2];
    
    //retain 所有参数，防止参数被释放dealloc
//    [invocation retainArguments];
    
    //消息调用
    [invocation invoke];
    
    //如果调用的消息有返回值，那么可进行以下处理
    
    //获得返回值类型
    const char *returnType = sig.methodReturnType;
    
    //声明返回值变量
    id returnValue;
    
    //如果没有返回值，也就是消息声明为void，那么returnValue=nil
    if( !strcmp(returnType, @encode(void)) )
    {
        returnValue =  nil;
    }
    
    //如果返回值为对象，那么为变量赋值
    else if( !strcmp(returnType, @encode(id)) )
    {
        //此处获取返回值
        [invocation getReturnValue:&returnValue];
    }
    else
    {
        //如果返回值为普通类型NSInteger  BOOL
        
        //返回值长度
        NSUInteger length = [sig methodReturnLength];
        
        //根据长度申请内存
        void *buffer = (void *)malloc(length);
        
        //为变量赋值
        [invocation getReturnValue:buffer];
        
        //以下代码为参考:具体地址我忘记了，等我找到后补上，(很对不起原作者)
        if( !strcmp(returnType, @encode(BOOL)) )
        {
            returnValue = [NSNumber numberWithBool:*((BOOL*)buffer)];
        }
        else if( !strcmp(returnType, @encode(NSInteger)) )
        {
            returnValue = [NSNumber numberWithInteger:*((NSInteger*)buffer)];
        }
        
        returnValue = [NSValue valueWithBytes:buffer objCType:returnType];
        
        NSLog(@"%@", returnValue);
    }
}

@end
