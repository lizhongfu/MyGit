//
//  CoreDataHelper.m
//  DataDemo
//
//  Created by Zogful.Lee on 13-2-26.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

// 模拟器文件路径
// /Users/sumomochuufuku/Library/Application Support/iPhone Simulator

#import "CoreDataHelper.h"

#define ManagedObjectModelFileName @"DataDemo"

static CoreDataHelper *sharedCoreDataHelper;

@implementation CoreDataHelper
@synthesize delegates = _delegates;
@synthesize managedObjectContextCDH = _managedObjectContextCDH;
@synthesize managedObjectModelCDH = _managedObjectModelCDH;
@synthesize persistentStoreCoordinatorCDH = _persistentStoreCoordinatorCDH;

void safeRelease(id pointer)
{
    if (!pointer)
    {
        [pointer release];
        pointer = nil;
    }
}

- (void) dealloc
{
    safeRelease(_delegates);
    safeRelease(_managedObjectContextCDH);
    safeRelease(_managedObjectModelCDH);
    safeRelease(_persistentStoreCoordinatorCDH);
    
    [super dealloc];
}

+ (id) sharedCoreDataHelper:(id<CoreDataHelperDelegate>) delegate
{
    @synchronized(self)
    {
        if (sharedCoreDataHelper == nil)
        {
            sharedCoreDataHelper = [[self alloc] initWithDelegate:delegate];
        } else
        {
            if (delegate)
                if (![sharedCoreDataHelper.delegates containsObject:delegate]) 
                    [sharedCoreDataHelper.delegates addObject:delegate];
        }
    }
    
    return sharedCoreDataHelper;
}

- (id) initWithDelegate:(id<CoreDataHelperDelegate>) delegate
{
    if (self = [super init])
    {
        _delegates = [[NSMutableArray alloc] init];
        if (delegate)
        {
            [_delegates addObject:delegate];
        }
        
        _managedObjectContextCDH = [self managedObjectContext];
    }
    
    return self;
}

- (BOOL) saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContextCDH;
    if (managedObjectContext != nil)
    {
        if (managedObjectContext != nil)
        {
            if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                return NO;
            }
        }
    } else
    {
        NSLog(@"Managed Object Context is nil");
        return NO;
    }
    
    NSLog(@"Context Saved");
    
    return YES;
}

#pragma mark - Application's Documents directory
- (NSURL *)applicationDocumentsDirectory{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Core Data stack
- (NSManagedObjectModel *) managedObjectModel
{
    if (_managedObjectModelCDH != nil)
    {
        return _managedObjectModelCDH;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:ManagedObjectModelFileName withExtension:@"momd"];
    _managedObjectModelCDH = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return _managedObjectModelCDH;
}

- (NSPersistentStoreCoordinator *) persistentStoreCoordinator
{
    if (_persistentStoreCoordinatorCDH != nil)
    {
        return _persistentStoreCoordinatorCDH;
    }
    
    _persistentStoreCoordinatorCDH = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:
                       [NSString stringWithFormat:@"%@.sqlite", ManagedObjectModelFileName]];
    
    NSError *error = nil;
    if (![_persistentStoreCoordinatorCDH addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:storeURL
                                                         options:nil
                                                           error:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinatorCDH;
}

- (NSManagedObjectContext *) managedObjectContext
{
    if (_managedObjectContextCDH != nil)
    {
        return _managedObjectContextCDH;
    }
        
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        
        [moc performBlockAndWait:^{
            NSUndoManager *undoManager = [[NSUndoManager alloc] init];
            [undoManager setGroupsByEvent:NO];
            [moc setUndoManager:undoManager];
            
            [moc setPersistentStoreCoordinator:coordinator];
        }];
        
        _managedObjectContextCDH = moc;
    }
    
    return _managedObjectContextCDH;
}

#pragma mark - Undo/Redo Operations

- (void)undo{
    [_managedObjectContextCDH undo];
    
}

- (void)redo{
    [_managedObjectContextCDH redo];
}

- (void)rollback{
    [_managedObjectContextCDH rollback];
}

- (void)reset{
    [_managedObjectContextCDH reset];
}

#pragma mark - Core Data operate

//增
- (BOOL) addDataToDB:(NSString *)entityName flag:(NSInteger) flag
{
    for (id<CoreDataHelperDelegate>delegate in _delegates)
    {
        if ([delegate respondsToSelector:@selector(coreDataHelperContext:insertData:flag:)])
        {
            [delegate coreDataHelperContext:[self managedObjectContext] insertData:entityName flag:flag];
            
            if ([self saveContext])
            {
                NSLog(@"数据源回调成功");
                return YES;
            } else
            {
                NSLog(@"数据源回调成功");
            }
        }
    }
    
    return YES;
}

//查
- (NSMutableArray *) fetchDataFormDB:(NSString    *) entityName
                           predicate:(NSPredicate *) predicate
                             sortKey:(NSString    *) sortKey
                           ascending:(BOOL         ) ascending;
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];

    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:[self managedObjectContext]];
    [request setEntity:entity];
    
    if (predicate != nil) {
        [request setPredicate:predicate];
    }
    
    if (sortKey != nil) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                            initWithKey:sortKey
                                            ascending:ascending];
        NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptions];
        [sortDescriptions release];
        [sortDescriptor release];
    }
    
    NSError *error = nil;
    NSMutableArray *mutableFetchResult = [[[self managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    
    
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@", error, [error userInfo]);
        abort();
    }
    [request release];
    
    return mutableFetchResult;
}

//删
- (BOOL)removeDataFormDB:(id) entity
{
    if (entity == nil) {
        return NO;
    }
    
    [[self managedObjectContext] deleteObject:entity];
    
    if ([self saveContext])
    {
        NSLog(@"数据删除成功");
        return YES;
    } else
    {
        NSLog(@"数据删除成功");
        return NO;
    }
}

- (BOOL)removeBatchDataFormDB:(NSArray *) entitys
{
    if (entitys == nil) {
        NSLog(@"请指定要删除的数据");
        return NO;
    }
    
    if ([entitys count] > 0) {
        
        for (id entity in entitys) {
            [[self managedObjectContext] deleteObject:entity];
        }
        
        if ([self saveContext])
        {
            NSLog(@"数据删除成功");
            return YES;
        }else
            return NO;
    }
    
    NSLog(@"请指定要删除的数据");
    return NO;
}

//改
- (BOOL) updateDataToDB:(id)entity entityName:(NSString *)entityName flag:(NSInteger) flag
{
    for (id<CoreDataHelperDelegate>delegate in _delegates)
    {
        if ([delegate respondsToSelector:@selector(coreDataHelperUpdateData:entityName:flag:)])
        {
            [delegate coreDataHelperUpdateData:entity entityName:entityName flag:flag];
            if ([self saveContext])
            {
                NSLog(@"数据更新成功");
                return YES;
            }else
            {
                NSLog(@"数据更新失败");
                return NO;
            }
        }
    }
    
    NSLog(@"数据更新失败");
    return NO;
}

@end
