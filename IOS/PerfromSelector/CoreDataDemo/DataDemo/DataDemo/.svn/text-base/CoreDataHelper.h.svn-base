//
//  CoreDataHelper.h
//  DataDemo
//
//  Created by Zogful.Lee on 13-2-26.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CoreDataHelperDelegate;
@interface CoreDataHelper : NSObject

@property (nonatomic, retain) NSMutableArray *delegates;
@property (atomic, retain, readonly) NSManagedObjectContext *managedObjectContextCDH;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModelCDH;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinatorCDH;

+ (id) sharedCoreDataHelper:(id<CoreDataHelperDelegate>) delegate;

- (id) initWithDelegate:(id<CoreDataHelperDelegate>) delegate;

- (BOOL) saveContext;

/*向数据库添加数据*/
- (BOOL) addDataToDB:(NSString *)entityName flag:(NSInteger) flag;

/*获取数据*/
- (NSMutableArray *) fetchDataFormDB:(NSString    *) entityName
                           predicate:(NSPredicate *) predicate
                             sortKey:(NSString    *) sortKey
                           ascending:(BOOL         ) ascending;

/*删除数据*/
- (BOOL) removeDataFormDB:(id) entity;
- (BOOL) removeBatchDataFormDB:(NSArray *) entitys;

/*更新数据*/
- (BOOL) updateDataToDB:(id        ) entity
             entityName:(NSString *) entityName
                   flag:(NSInteger ) flag;

//撤销自上次用户控件事件发生以来，对数据所做的人和修改
- (void)undo;

//只有在之前调用过undo方法时，这个方法的重做被撤销的修改
- (void)redo;

//将对受控对象上下文的所有修改回滚，回到最后一次提交的状态。这个操作同时也会清空纪录在撤销操作缓存中的所有修改
- (void)rollback;

//清空纪录在撤销操作缓存中的所有修改
- (void)reset;

@end

@protocol CoreDataHelperDelegate<NSObject>

//插入数据的时候，要在代理中实现此方法，此方法提供插入的数据
- (void) coreDataHelperContext:(NSManagedObjectContext *) context
                    insertData:(NSString *)entityName
                          flag:(NSInteger) flag;

//更新数据时，要在代理中实现此方法，此方法提供更新的数据
- (void) coreDataHelperUpdateData:(id        ) entity
                       entityName:(NSString *) entityName
                             flag:(NSInteger ) flag;

@end




