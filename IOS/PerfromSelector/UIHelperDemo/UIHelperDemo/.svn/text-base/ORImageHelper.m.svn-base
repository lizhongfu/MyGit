//
//  ORImageHelper.m
//  ParentHelper
//
//  Created by Zogful Lee on 12-9-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ORImageHelper.h"

@implementation ORImageHelper
@end

NSString *documentsFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

NSString *bundleFolder()
{
	return [[NSBundle mainBundle] bundlePath];
}

NSString *DCIMFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"../../Media/DCIM"];
}

NSString *IMGFolder()
{
    return [[[NSBundle mainBundle]resourcePath]stringByAppendingString:@"/images/"];
}

@implementation ORImageHelper (Files)

+(NSString*)pathForImage:(NSString*)file{
    return [IMGFolder() stringByAppendingString:file];
}

+(UIImage*)imageByFileName:(NSString*)filename{
    UIImage* img=[UIImage imageWithContentsOfFile:[self pathForImage:filename]];
//    NSAssert(img, @"the image can not be nil!");
    return img;
}

+ (NSString *) pathForItemNamed: (NSString *) fname inFolder: (NSString *) path
{
	NSString *file;
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while (file = [dirEnum nextObject]) 
		if ([[file lastPathComponent] isEqualToString:fname]) 
			return [path stringByAppendingPathComponent:file];
	return nil;
}

// Searches bundle first then documents folder
+ (UIImage *) imageNamed: (NSString *) aName
{
	NSString *path = [ORImageHelper pathForItemNamed:aName inFolder:bundleFolder()];
	path = path ? path : [ORImageHelper pathForItemNamed:aName inFolder:documentsFolder()];
	if (!path) return nil;
	return [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *) imageFromURLString: (NSString *) urlstring
{
	NSURL *url = [NSURL URLWithString:urlstring];
	return [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
}

+ (NSArray *) DCIMImages
{
	NSString *file;
	NSMutableArray *results = [NSMutableArray array];
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:DCIMFolder()];
	while (file = [dirEnum nextObject]) if ([file hasSuffix:@"JPG"]) [results addObject:file];
	return results;
}

+ (UIImage *) DCIMImageNamed: (NSString *) aName
{
	NSString *path = [ORImageHelper pathForItemNamed:aName inFolder:DCIMFolder()];
	return [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *) imageWithSize:(CGSize) size
                     opaque:(BOOL) opaque 
                      color:(UIColor *) color
{
    UIGraphicsBeginImageContextWithOptions(size, opaque, 1.0);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(void)tileImage:(UIView*)view imgName:(NSString*)fn{
    NSString *path=[self pathForImage:fn];
    view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:path]];
    [view setOpaque:NO];
    [[view layer] setOpaque:NO];
}

@end
