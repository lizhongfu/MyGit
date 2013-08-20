//
//  Authors.h
//  DataDemo
//
//  Created by Zogful.Lee on 13-2-25.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entry;

@interface Authors : NSManagedObject

@property (nonatomic, retain) NSString *entry;
@property (nonatomic, retain) Entry *newRelationship;

@end
