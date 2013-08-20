//
//  ViewManager.h
//  Graphics
//
//  Created by Zogful.Lee on 13-2-11.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewManager : NSObject

+ (UIView *) baseView;

+ (CGRect) mainWindowFrame;

+ (CGRect) viewFrameWithout_statueBar_headerBar_footerBar;

+ (CGRect) viewFrameWithout_statueBar;

+ (CGRect) viewFrameWithout_headerBar;

+ (CGRect) viewFrameWithout_footerBar;

+ (float) applicationFrame_width;

+ (float) applicationFrame_height;

@end
