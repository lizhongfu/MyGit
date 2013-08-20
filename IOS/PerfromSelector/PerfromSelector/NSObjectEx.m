//
//  NSObject_PerformSelectorEx.m
//  PerfromSelector
//
//  Created by Zogful.Lee on 13-4-2.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "NSObjectEx.h"

@implementation NSObject (performSelectorOnMainThreadAfterDelay)

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay
{
    NSMethodSignature *sig = [self methodSignatureForSelector:aSelector];
    if (!sig) return;
   
    NSInvocation *invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:aSelector];
    [invo setArgument:&anArgument atIndex:2];
    [invo retainArguments];
    
    NSMethodSignature *sigMT = [invo methodSignatureForSelector:@selector(performSelector:withObject:afterDelay:)];
    NSInvocation *invoMT = [NSInvocation invocationWithMethodSignature:sigMT];
    [invoMT setTarget:invo];
    [invoMT setSelector:@selector(performSelector:withObject:afterDelay:)];
    
    SEL arg1 = @selector(invoke);
    void *arg2 = nil;
    NSTimeInterval arg3 = delay;
    
    [invoMT setArgument:&arg1 atIndex:2];
    [invoMT setArgument:&arg2 atIndex:3];
    [invoMT setArgument:&arg3 atIndex:4];
    [invoMT retainArguments];
    [invoMT performSelectorOnMainThread:@selector(invoke) withObject:nil waitUntilDone:NO];
}

@end



@implementation NSObject (performSelectorOnMainThreadWithObjects)

- (void) performSelectorOnMainThread:(SEL)selector withObjects:(NSArray *)args waitUntilDone:(BOOL)wait
{
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    if (!sig) return;
    
    NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    
    for (int i=2; i<[args count]+2; i++)
    {
        id arg = [args objectAtIndex:i-2];
        [invo setArgument:&arg atIndex:i];
    }
    
    [invo retainArguments];
    [invo performSelectorOnMainThread:@selector(invoke) withObject:nil waitUntilDone:wait];
}

@end

@implementation NSObject (Addition)

- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects
{
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    if (signature) {
        NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:selector];
        for(int i = 0; i < [objects count]; i++){
            id object = [objects objectAtIndex:i];
            [invocation setArgument:&object atIndex: (i + 2)];
        }
        [invocation invoke];
        if (signature.methodReturnLength) {
            id anObject;
            [invocation getReturnValue:&anObject];
            return anObject;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

@end


