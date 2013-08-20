//
//  AppDelegate.m
//  KVODemo
//
//  Created by Zogful.Lee on 13-4-11.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "Book.h"

Book *book = nil;

@implementation AppDelegate

- (void)dealloc
{
    [book removeObserver:self forKeyPath:@"price"];
    
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    book = [[Book alloc] initWithName:@"name1" price:10];
    [book addObserver:self
           forKeyPath:@"price"
              options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew  //决定返回字典中的参数
              context:nil];
    
    book.price = 20;
    
    book.price = 10;
    
    return YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ((object != nil) &&
		[keyPath isEqualToString:@"price"] &&
		([change objectForKey:NSKeyValueChangeOldKey] == nil ||
		 [change objectForKey:NSKeyValueChangeOldKey] == [NSNull null]))
    {
		NSLog(@"%@", change);
	}
}

@end
