//
//  KvoViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KvoViewController.h"

//class Bank
@interface Bank : NSObject {
    int accountBalance;
}

@property (nonatomic, assign) int accountBalance;

@end

@implementation Bank
@synthesize accountBalance;

- (id) init {
    self = [super init];
    
    return self;
}
@end

//class person
@interface Person : NSObject {
    
}

@end

@implementation Person

- (id) init {
    self = [super init];
    
    return self;
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    NSLog(@"keyPath:%@", keyPath);
    NSLog(@"object:%@", object);
    NSLog(@"change:%@", change);
}

@end

@implementation KvoViewController

+ (NSString *)friendlyName {
    return @"KVO学习";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.frame = BaseFrame;
    
    Bank *bank = [[Bank alloc] init];
    
    Person *person = [[Person alloc] init];
    [bank addObserver:person forKeyPath:@"accountBalance" options:NSKeyValueObservingOptionNew context:NULL];
    
    [bank setAccountBalance:50];
}


@end
