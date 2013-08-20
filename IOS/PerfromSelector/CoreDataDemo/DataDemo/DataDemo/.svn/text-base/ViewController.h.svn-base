//
//  ViewController.h
//  DataDemo
//
//  Created by Zogful.Lee on 13-2-25.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataHelper.h"

@class AppDelegate;

@interface ViewController : UIViewController <CoreDataHelperDelegate>

@property (retain, nonatomic) IBOutlet UITextField *titleTextField;
@property (retain, nonatomic) IBOutlet UITextField *contentTextField;
@property (strong,nonatomic) NSMutableArray *entries;

//单击按钮后执行数据保存操作
- (IBAction)addToDB:(id)sender;

//单击按钮后执行查询操作
- (IBAction)queryFromDB:(id)sender;

- (IBAction)deleteFromDB:(id)sender;

- (IBAction)updateFromDB:(id)sender;

@end
