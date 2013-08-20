//
//  ORUserDefault.h
//  ParentHelper
//
//  Created by Zogful.Lee on 12-12-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ORUserDefault : NSObject

//存储对象
+(NSObject *) getUserDefaults:(NSString *) name;
+(void) setUserDefaults:(NSObject *) defaults forKey:(NSString *) key;

//存储BOOL
+(BOOL) getUserDefaultsBool:(NSString *) name;
+(void) setUserDefaultsBool:(BOOL)value forKey:(NSString *)defaultName;

//存储int
+(NSInteger) getUserDefaultsInt:(NSString *) name;
+(void) setUserDefaultsInt:(NSInteger)value forKey:(NSString *)defaultName;

@end
