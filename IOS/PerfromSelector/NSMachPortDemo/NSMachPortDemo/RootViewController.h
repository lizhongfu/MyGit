//
//  RootViewController.h
//  NSMachPortDemo
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyWorkerThread.h"

@interface RootViewController : UIViewController <NSPortDelegate, NSMachPortDelegate>

@end

/*
 配置基于端口的输入源:
 
 */