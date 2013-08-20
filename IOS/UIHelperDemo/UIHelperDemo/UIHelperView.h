//
//  UIHelperView.h
//  UIHelperDemo
//
//  Created by Zogful.Lee on 13-4-24.
//  Copyright (c) 2013年 Lucky. All rights reserved.
//

#import "UIHelperDefine.h"

@interface UIView (UIHelper)

+ (UIView *) viewWithtouchesBegan:( void(^)(NSSet *touches, UIEvent *event) ) touchesBeganBlock
                     touchesMoved:( void(^)(NSSet *touches, UIEvent *event) ) touchesMovedBlock
                     touchesEnded:( void(^)(NSSet *touches, UIEvent *event) ) touchesEndedBlock
                 touchesCancelled:( void(^)(NSSet *touches, UIEvent *event) ) touchesCancelledBlock;

@end

@interface UIControl (UIHelper)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(void(^)(id sender))block;
- (void)removeHandlerForEvent:(UIControlEvents)event;

@end

@interface UIAlertView(UIHelper)

+ (void) showWithTitle:(NSString *) title
               message:(NSString *) message
               buttons:(NSArray *) buttons
            completion:(void(^)(NSInteger buttonIndex)) block;


@end


@interface UIActionSheet(UIHelper)

+ (void) showInView:(UIView *) view
              title:(NSString *) title
            buttons:(NSArray *) buttons
        cancelIndex:(NSInteger) cancelIndex
   destructiveIndex:(NSInteger) destructiveIndex
         completion:(void(^)(NSInteger buttonIndex)) block;

+ (void) showFromToolbar:(UIToolbar *) view
                   title:(NSString *) title
                 buttons:(NSArray *) buttons
             cancelIndex:(NSInteger) cancelIndex
        destructiveIndex:(NSInteger) destructiveIndex
              completion:(void(^)(NSInteger buttonIndex)) block;

+ (void) showFromTabBar:(UITabBar *)view
                  title:(NSString *) title
                buttons:(NSArray *) buttons
            cancelIndex:(NSInteger) cancelIndex
       destructiveIndex:(NSInteger) destructiveIndex
             completion:(void(^)(NSInteger buttonIndex)) block;

+ (void) showFromRect:(CGRect)rect
               inView:(UIView *)view
             animated:(BOOL)animated
                title:(NSString *) title
              buttons:(NSArray *) buttons
          cancelIndex:(NSInteger) cancelIndex
     destructiveIndex:(NSInteger) destructiveIndex
           completion:(void(^)(NSInteger buttonIndex)) block;

+ (void) showFromBarButtonItem:(UIBarButtonItem *) item
                      animated:(BOOL) animated
                         title:(NSString *) title
                       buttons:(NSArray *) buttons
                   cancelIndex:(NSInteger) cancelIndex
              destructiveIndex:(NSInteger) destructiveIndex
                    completion:(void(^)(NSInteger buttonIndex)) block;

@end