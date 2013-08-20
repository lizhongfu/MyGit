//
//  ORUserDefault.m
//  ParentHelper
//
//  Created by Zogful.Lee on 12-12-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ORUserDefault.h"

@implementation ORUserDefault

+(NSUserDefaults *) userDefaults
{
    return  [NSUserDefaults standardUserDefaults];
}

+(NSObject *) getUserDefaults:(NSString *) name{
    return [[self userDefaults] objectForKey:name];
}
+(void) setUserDefaults:(NSObject *) defaults forKey:(NSString *) key{
    [[self userDefaults] setObject:defaults forKey:key];
	[[self userDefaults] synchronize];
}


+ (BOOL) getUserDefaultsBool:(NSString *) name {
    return [[self userDefaults] boolForKey:name];
}
+ (void) setUserDefaultsBool:(BOOL)value forKey:(NSString *)defaultName {
    [[self userDefaults] setBool:value forKey:defaultName];
	[[self userDefaults] synchronize];
}


+(NSInteger) getUserDefaultsInt:(NSString *) name
{
    return [[self userDefaults] integerForKey:name];
}

+(void) setUserDefaultsInt:(BOOL)value forKey:(NSString *)defaultName
{
    [[self userDefaults] setInteger:value forKey:defaultName];
	[[self userDefaults] synchronize];
}

@end
