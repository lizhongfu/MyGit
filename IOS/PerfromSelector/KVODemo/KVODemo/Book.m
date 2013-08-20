//
//  Book.m
//  KVODemo
//
//  Created by Zogful.Lee on 13-4-11.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "Book.h"

@implementation Book
@synthesize name, price;

- (id) initWithName:(NSString *) aName price:(float) aPrice
{
    if (self = [super init])
    {
        self.name = aName;
        self.price = aPrice;
    }
    
    return self;
}

@end
