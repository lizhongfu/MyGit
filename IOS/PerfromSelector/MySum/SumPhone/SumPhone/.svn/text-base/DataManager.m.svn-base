//
//  DataManager.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

- (void) dealloc {
    
    [samples_ release];
    [groups_ release];
    
    [super dealloc];
}

- (id) init {
    
    if ([super init]) {
        
        samples_ = [[NSMutableArray alloc] initWithCapacity:0];
        groups_ = [[NSMutableArray alloc] initWithCapacity:0];
        
        NSArray *resource = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Data-info" ofType:@"plist"]];
        
        for (int i=0; i<[resource count]; i++) {
            
            [samples_ addObject:[[resource objectAtIndex:i] valueForKey:@"ViewControllers"]];
            [groups_ addObject:[[resource objectAtIndex:i] valueForKey:@"title"]];
        }
    }
    
    return self;
}
@end
