//
//  UIHelperDelegates.m
//  UIHelperDemo
//
//  Created by Zogful.Lee on 13-4-24.
//  Copyright (c) 2013年 Lucky. All rights reserved.
//

#import "UIHelperDelegate.h"

static UIHelperDelegate *delegate = nil;

@implementation UIHelperDelegate

+ (UIHelperDelegate *) shareUIHelperDelegate
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        delegate = [[UIHelperDelegate alloc] init];
    });
    
    return delegate;
}


#pragma mark -
#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void (^handler)(NSInteger buttonIndex) = objc_getAssociatedObject(alertView, UIAlertViewBlockKey);
    
    if(handler == nil)
    {
        return;
    }
    
    handler(buttonIndex);
}

#pragma mark -
#pragma mark - UIActionSheetDelegat

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void (^handler)(NSInteger buttonIndex) = objc_getAssociatedObject(actionSheet, UIActionSheetBlockKey);
    
    if(handler == nil)
    {
        return;
    }
    
    handler(buttonIndex);
}

@end
