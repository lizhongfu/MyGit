//
//  NSObject_PerformSelectorEx.h
//  PerfromSelector
//
//  Created by Zogful.Lee on 13-4-2.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

//afterDelay方法实现在主线程执行
@interface NSObject (performSelectorOnMainThreadAfterDelay)

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay;

@end


//多参数
@interface NSObject (performSelectorOnMainThreadWithObjects)

- (void) performSelectorOnMainThread:(SEL)selector withObjects:(NSArray *)args waitUntilDone:(BOOL)wait;
@end

//有返回值
@interface NSObject (Addition)
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects;
@end
