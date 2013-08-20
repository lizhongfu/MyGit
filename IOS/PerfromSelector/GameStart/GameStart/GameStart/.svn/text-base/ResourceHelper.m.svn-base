//  scaffold
//
//  Created by zzy on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ResourceHelper.h"

@implementation ResourceHelper

+(UIImage *) loadImageByTheme:(NSString *) name{    
    NSString *file = [[[NSString alloc] initWithFormat:@"themes/%@/%@",[ResourceHelper  getUserDefaults:@"theme"],name] autorelease];
	NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"png"];
	return [[[UIImage alloc] initWithContentsOfFile:path] autorelease];
}

+(UIImage *) loadImage:(NSString *) name{
    NSString *realName = name;
	NSString *path = [[NSBundle mainBundle] pathForResource:realName ofType:@"png"];
    [realName release];
    
	return [[[UIImage alloc] initWithContentsOfFile:path] autorelease];
}

+(NSObject *) getUserDefaults:(NSString *) name{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:name];
}

+(void) setUserDefaults:(NSObject *) defaults forKey:(NSString *) key{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:defaults forKey:key];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

@end
