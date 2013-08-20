//
//  ModelTable.m
//  SearchTable
//
//  Created by Zogful Lee on 12-5-5.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ModelTable.h"

@implementation ModelTable
@synthesize name;
@synthesize sex;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@", [self name], [self sex]];
}

@end
