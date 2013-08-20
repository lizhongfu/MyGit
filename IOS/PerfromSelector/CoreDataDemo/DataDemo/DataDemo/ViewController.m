//
//  ViewController.m
//  DataDemo
//
//  Created by Zogful.Lee on 13-2-25.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ViewController.h"
#import "Entry.h" 

@interface ViewController ()

@end

@implementation ViewController
@synthesize titleTextField;
@synthesize contentTextField;
@synthesize entries = _entries;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//单击按钮后执行数据保存操作
- (IBAction)addToDB:(id)sender
{
    [[CoreDataHelper sharedCoreDataHelper:self] addDataToDB:@"Entry" flag:0];
}

//单击按钮后执行查询操作
- (IBAction)queryFromDB:(id)sender
{
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title == %@",@"XXX"];
    
    self.entries = [[CoreDataHelper sharedCoreDataHelper:self] fetchDataFormDB:@"Entry" predicate:nil sortKey:@"creationDate" ascending:NO];
    for (Entry *entry in self.entries) {
        NSLog(@"Title:%@---Content:%@---Date:%@",entry.title,entry.body,entry.creationDate);
    }
}

- (IBAction)deleteFromDB:(id)sender
{
    NSMutableArray *array = [[CoreDataHelper sharedCoreDataHelper:self] fetchDataFormDB:@"Entry" predicate:nil sortKey:@"creationDate" ascending:NO];
    
    [((CoreDataHelper*)[CoreDataHelper sharedCoreDataHelper:self]) removeBatchDataFormDB:array];
}

- (IBAction)updateFromDB:(id)sender
{
    NSMutableArray *array = [[CoreDataHelper sharedCoreDataHelper:self] fetchDataFormDB:@"Entry" predicate:nil sortKey:@"creationDate" ascending:NO];
    
    for (Entry *entry in array)
    {
        [((CoreDataHelper*)[CoreDataHelper sharedCoreDataHelper:self]) updateDataToDB:entry entityName:@"Entry" flag:0];
    }
}

#pragma mark -
#pragma mark CoreDataHelperDelegate

//向数据库添加数据时候的，从此方法获得数据
- (void) coreDataHelperContext:(NSManagedObjectContext *) context insertData:(NSString *)entityName flag:(NSInteger) flag
{    
    Entry *entry = (Entry *)[NSEntityDescription insertNewObjectForEntityForName:@"Entry"
                                                          inManagedObjectContext:context];
    
    [entry setTitle:@"aaa"];
    [entry setBody:@"bbb"];
    [entry setCreationDate:[NSDate date]];
}

//更新数据库数据时候要实现的数据源方法
- (void) coreDataHelperUpdateData:(id)entity entityName:(NSString *)entityName flag:(NSInteger) flag
{
    [entity setTitle:@"QQQ"];
    [entity setBody:@"QQQ"];
    [entity setCreationDate:[NSDate date]];
}
@end
