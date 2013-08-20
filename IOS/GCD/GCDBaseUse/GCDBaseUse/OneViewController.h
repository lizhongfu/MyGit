//
//  OneViewController.h
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-4-16.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneViewController : UIViewController


//无序并发
- (IBAction)selector0:(id)sender;

//无序并发处理数据
- (IBAction)selector100:(id)sender;

//执行一次
- (IBAction)selector1:(id)sender;

//异步／后台执行
- (IBAction)selector2:(id)sender;

//后台执行，然后返回主线程
- (IBAction)selector3:(id)sender;

//三种队列执行
- (IBAction)selector4:(UISegmentedControl *)sender;

//延迟执行
- (IBAction)selector5:(id)sender;

@end
