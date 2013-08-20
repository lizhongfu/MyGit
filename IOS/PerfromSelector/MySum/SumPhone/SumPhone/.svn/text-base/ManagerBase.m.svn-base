//
//  ManagerBase.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ManagerBase.h"

@interface UIViewController (ThisIsHereToAviodACompilerWarning)

+ (NSString *)friendlyName;

@end

@implementation ManagerBase

- (void) dealloc {
    
    [samples_ release];
    [groups_ release];
    
    [super dealloc];
}

- (id) init {
    
    if ([super init]) {
        
        samples_ = [[NSMutableArray alloc] initWithCapacity:0];
        groups_ = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    return self;
}

- (NSUInteger) groupCount {
    
    return [groups_ count];
}

- (NSUInteger) sampleCountForGroup:(NSUInteger) group {
    
    return [[samples_ objectAtIndex:group] count];
}

- (NSString *) groupTitleAtIndex:(NSUInteger) index {
    
    return [[[groups_ objectAtIndex:index] copy] autorelease];
}

- (NSString *) sampleNameAtIndexPath:(NSIndexPath *) indexPath {
    
    NSArray *samples = [samples_ objectAtIndex:indexPath.section];
    Class clazz = NSClassFromString([samples objectAtIndex:indexPath.row]);
    
    return [clazz friendlyName];
}

- (UIViewController *) sampleForIndexPath:(NSIndexPath *) indexPath {
    
    NSArray *samples = [samples_ objectAtIndex:indexPath.section];
    Class clazz = NSClassFromString([samples objectAtIndex:indexPath.row]);
    
    return [[[clazz alloc] init] autorelease];
}

@end
