//
//  ViewManager.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-11.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ViewManager.h"

#define screen_width   ([UIScreen mainScreen].applicationFrame.size.width)
#define screen_height  ([UIScreen mainScreen].applicationFrame.size.height)

@implementation ViewManager

+ (UIView *) baseView
{
    return [[[UIView alloc] initWithFrame:[ViewManager viewFrameWithout_headerBar]] autorelease];
}

+ (CGRect) mainWindowFrame
{
    return [[UIScreen mainScreen] bounds];
}

+ (CGRect) viewFrameWithout_statueBar_headerBar_footerBar
{
    return CGRectMake(0, 0, screen_width, screen_height-44-49);
}

+ (CGRect) viewFrameWithout_statueBar
{
    return CGRectMake(0, 0, screen_width, screen_height);
}

+ (CGRect) viewFrameWithout_headerBar
{
    return CGRectMake(0, 0, screen_width, screen_height-44);
}

+ (CGRect) viewFrameWithout_footerBar
{
    return CGRectMake(0, 0, screen_width, screen_height-49);
}

+ (float) applicationFrame_width
{
    return screen_width;
}

+ (float) applicationFrame_height
{
    return screen_height;
}

+ (ViewManager *) sharedViewManager
{
    static ViewManager *viewManager;
    
    if (viewManager == nil) {
        viewManager = [[ViewManager alloc] init];
    }

    return viewManager;
}

@end
