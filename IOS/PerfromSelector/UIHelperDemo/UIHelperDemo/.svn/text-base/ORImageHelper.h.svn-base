//
//  ORImageHelper.h
//  ParentHelper
//
//  Created by Zogful Lee on 12-9-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ORImageHelper : NSObject

@end

@interface ORImageHelper (Files)

+ (UIImage *) imageNamed: (NSString *) aName;
+ (UIImage *) imageFromURLString: (NSString *) urlstring;
+ (NSArray *) DCIMImages;
+ (UIImage *) DCIMImageNamed: (NSString *) aName;
+ (UIImage *) imageWithSize:(CGSize) size
                    opaque:(BOOL) opaque 
                     color:(UIColor *) color;

+(NSString*)pathForImage:(NSString*)file;
+(UIImage*)imageByFileName:(NSString*)filename;
//***
//<<Set background view by tile image>>
//How to use:
//[ORImageHelper tileImage:self.view imgName:FN_TILE];
//***
+(void)tileImage:(UIView*)view imgName:(NSString*)fn;
@end
