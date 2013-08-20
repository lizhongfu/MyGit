//
//  MyWorkerThread.h
//  NSMachPortDemo
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyWorkerThread : NSObject <NSMachPortDelegate>


+ (void)LaunchThreadWithPort:(id)inData;

@end
