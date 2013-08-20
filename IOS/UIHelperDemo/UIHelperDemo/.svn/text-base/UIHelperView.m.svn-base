//
//  UIHelperView.m
//  UIHelperDemo
//
//  Created by Zogful.Lee on 13-4-24.
//  Copyright (c) 2013年 Lucky. All rights reserved.
//

#import "UIHelperView.h"

id safetyParam(id sender, NSString *className)
{
    if (sender == nil)
    {
        if ([className isEqualToString:@"NSString"])
        {
            return [NSString string];
        } else if ([className isEqualToString:@"NSArray"])
        {
            return [NSArray array];
        }
    }
    return sender;
}


////////////////////////////////     UIView    //////////////////////////////////////////


@implementation UIView (UIHelper)

+ (UIView *) viewWithtouchesBegan:( void(^)(NSSet *touches, UIEvent *event) ) touchesBeganBlock
                     touchesMoved:( void(^)(NSSet *touches, UIEvent *event) ) touchesMovedBlock
                     touchesEnded:( void(^)(NSSet *touches, UIEvent *event) ) touchesEndedBlock
                 touchesCancelled:( void(^)(NSSet *touches, UIEvent *event) ) touchesCancelledBlock
{
    UIView *theView = [[UIView alloc] init];
    
    NSArray *opreations = (NSArray *)objc_getAssociatedObject(theView, UIViewBlockKey);
    if (opreations == nil)
    {
        opreations = [[NSArray arrayWithObjects:touchesBeganBlock, touchesMovedBlock, touchesEndedBlock, touchesCancelledBlock, nil] retain];
        objc_setAssociatedObject(theView, UIViewBlockKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    
    return [theView autorelease];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *opreations = (NSArray *)objc_getAssociatedObject(self, UIViewBlockKey);
    
    void(^handle)(NSSet *touches, UIEvent *event) = [opreations objectAtIndex:0];
    if (handle == nil)
    {
        return;
    }
    
    handle(touches, event);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *opreations = (NSArray *)objc_getAssociatedObject(self, UIViewBlockKey);
    
    void(^handle)(NSSet *touches, UIEvent *event) = [opreations objectAtIndex:1];
    if (handle == nil)
    {
        return;
    }
    
    handle(touches, event);
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *opreations = (NSArray *)objc_getAssociatedObject(self, UIViewBlockKey);
    
    void(^handle)(NSSet *touches, UIEvent *event) = [opreations objectAtIndex:2];
    if (handle == nil)
    {
        return;
    }
    
    handle(touches, event);
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *opreations = (NSArray *)objc_getAssociatedObject(self, UIViewBlockKey);
    
    void(^handle)(NSSet *touches, UIEvent *event) = [opreations objectAtIndex:3];
    if (handle == nil)
    {
        return;
    }
    
    handle(touches, event);
}

@end


////////////////////////////////     UIControl     //////////////////////////////////////////

@implementation UIControl (UIHelper)

- (void)removeHandlerForEvent:(UIControlEvents)event
{
    
    NSString *methodName = [UIControl eventName:event];
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, UIControlBlockKey);
    
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, UIControlBlockKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations removeObjectForKey:methodName];
    [self removeTarget:self action:NSSelectorFromString(methodName) forControlEvents:event];
}

- (void)handleControlEvent:(UIControlEvents)event withBlock:(void(^)(id sender))block {
    
    NSString *methodName = [UIControl eventName:event];
    
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, UIControlBlockKey);
    
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, UIControlBlockKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:block forKey:methodName];
    
    [self addTarget:self action:NSSelectorFromString(methodName) forControlEvents:event];
    
}


-(void)UIControlEventTouchDown{[self callActionBlock:UIControlEventTouchDown];}
-(void)UIControlEventTouchDownRepeat{[self callActionBlock:UIControlEventTouchDownRepeat];}
-(void)UIControlEventTouchDragInside{[self callActionBlock:UIControlEventTouchDragInside];}
-(void)UIControlEventTouchDragOutside{[self callActionBlock:UIControlEventTouchDragOutside];}
-(void)UIControlEventTouchDragEnter{[self callActionBlock:UIControlEventTouchDragEnter];}
-(void)UIControlEventTouchDragExit{[self callActionBlock:UIControlEventTouchDragExit];}
-(void)UIControlEventTouchUpInside{[self callActionBlock:UIControlEventTouchUpInside];}
-(void)UIControlEventTouchUpOutside{[self callActionBlock:UIControlEventTouchUpOutside];}
-(void)UIControlEventTouchCancel{[self callActionBlock:UIControlEventTouchCancel];}
-(void)UIControlEventValueChanged{[self callActionBlock:UIControlEventValueChanged];}
-(void)UIControlEventEditingDidBegin{[self callActionBlock:UIControlEventEditingDidBegin];}
-(void)UIControlEventEditingChanged{[self callActionBlock:UIControlEventEditingChanged];}
-(void)UIControlEventEditingDidEnd{[self callActionBlock:UIControlEventEditingDidEnd];}
-(void)UIControlEventEditingDidEndOnExit{[self callActionBlock:UIControlEventEditingDidEndOnExit];}
-(void)UIControlEventAllTouchEvents{[self callActionBlock:UIControlEventAllTouchEvents];}
-(void)UIControlEventAllEditingEvents{[self callActionBlock:UIControlEventAllEditingEvents];}
-(void)UIControlEventApplicationReserved{[self callActionBlock:UIControlEventApplicationReserved];}
-(void)UIControlEventSystemReserved{[self callActionBlock:UIControlEventSystemReserved];}
-(void)UIControlEventAllEvents{[self callActionBlock:UIControlEventAllEvents];}


- (void)callActionBlock:(UIControlEvents)event {
    
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, UIControlBlockKey);
    
    if(opreations == nil) return;
    void(^block)(id sender) = [opreations objectForKey:[UIControl eventName:event]];
    
    if (block) block(self);
    
}
+(NSString *)eventName:(UIControlEvents)event
{
    switch (event) {
        case UIControlEventTouchDown:          return @"UIControlEventTouchDown";
        case UIControlEventTouchDownRepeat:    return @"UIControlEventTouchDownRepeat";
        case UIControlEventTouchDragInside:    return @"UIControlEventTouchDragInside";
        case UIControlEventTouchDragOutside:   return @"UIControlEventTouchDragOutside";
        case UIControlEventTouchDragEnter:     return @"UIControlEventTouchDragEnter";
        case UIControlEventTouchDragExit:      return @"UIControlEventTouchDragExit";
        case UIControlEventTouchUpInside:      return @"UIControlEventTouchUpInside";
        case UIControlEventTouchUpOutside:     return @"UIControlEventTouchUpOutside";
        case UIControlEventTouchCancel:        return @"UIControlEventTouchCancel";
        case UIControlEventValueChanged:       return @"UIControlEventValueChanged";
        case UIControlEventEditingDidBegin:    return @"UIControlEventEditingDidBegin";
        case UIControlEventEditingChanged:     return @"UIControlEventEditingChanged";
        case UIControlEventEditingDidEnd:      return @"UIControlEventEditingDidEnd";
        case UIControlEventEditingDidEndOnExit:return @"UIControlEventEditingDidEndOnExit";
        case UIControlEventAllTouchEvents:     return @"UIControlEventAllTouchEvents";
        case UIControlEventAllEditingEvents:   return @"UIControlEventAllEditingEvents";
        case UIControlEventApplicationReserved:return @"UIControlEventApplicationReserved";
        case UIControlEventSystemReserved:     return @"UIControlEventSystemReserved";
        case UIControlEventAllEvents:          return @"UIControlEventAllEvents";
        default:
            return @"description";
    }
    return @"description";
}
+(UIControlEvents)eventWithName:(NSString *)name
{
    if([name isEqualToString:@"UIControlEventTouchDown"])           return UIControlEventTouchDown;
    if([name isEqualToString:@"UIControlEventTouchDownRepeat"])     return UIControlEventTouchDownRepeat;
    if([name isEqualToString:@"UIControlEventTouchDragInside"])     return UIControlEventTouchDragInside;
    if([name isEqualToString:@"UIControlEventTouchDragOutside"])    return UIControlEventTouchDragOutside;
    if([name isEqualToString:@"UIControlEventTouchDragEnter"])      return UIControlEventTouchDragEnter;
    if([name isEqualToString:@"UIControlEventTouchDragExit"])       return UIControlEventTouchDragExit;
    if([name isEqualToString:@"UIControlEventTouchUpInside"])       return UIControlEventTouchUpInside;
    if([name isEqualToString:@"UIControlEventTouchUpOutside"])      return UIControlEventTouchUpOutside;
    if([name isEqualToString:@"UIControlEventTouchCancel"])         return UIControlEventTouchCancel;
    if([name isEqualToString:@"UIControlEventTouchDown"])           return UIControlEventTouchDown;
    if([name isEqualToString:@"UIControlEventValueChanged"])        return UIControlEventValueChanged;
    if([name isEqualToString:@"UIControlEventEditingDidBegin"])     return UIControlEventEditingDidBegin;
    if([name isEqualToString:@"UIControlEventEditingChanged"])      return UIControlEventEditingChanged;
    if([name isEqualToString:@"UIControlEventEditingDidEnd"])       return UIControlEventEditingDidEnd;
    if([name isEqualToString:@"UIControlEventEditingDidEndOnExit"]) return UIControlEventEditingDidEndOnExit;
    if([name isEqualToString:@"UIControlEventAllTouchEvents"])      return UIControlEventAllTouchEvents;
    if([name isEqualToString:@"UIControlEventAllEditingEvents"])    return UIControlEventAllEditingEvents;
    if([name isEqualToString:@"UIControlEventApplicationReserved"]) return UIControlEventApplicationReserved;
    if([name isEqualToString:@"UIControlEventSystemReserved"])      return UIControlEventSystemReserved;
    if([name isEqualToString:@"UIControlEventAllEvents"])           return UIControlEventAllEvents;
    return UIControlEventAllEvents;
}

@end

////////////////////////////////     UIAlertView     //////////////////////////////////////////

@implementation UIAlertView(UIHelper)

+ (void) showWithTitle:(NSString *) title
               message:(NSString *) message
               buttons:(NSArray *) buttons
            completion:(void(^)(NSInteger buttonIndex)) block
{
    title = safetyParam(title, @"NSString");
    message = safetyParam(message, @"NSString");
    buttons = safetyParam(buttons, @"NSArray");
    
    UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
    alert.delegate = [UIHelperDelegate shareUIHelperDelegate];
    
    if (block != nil)
    {
        objc_setAssociatedObject(alert, UIAlertViewBlockKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    
    [alert setTitle:title];
    [alert setMessage:message];
    
    for (NSString *btTitle in buttons)
    {
        [alert addButtonWithTitle:btTitle];
    }
    
    [alert show];
}

@end

////////////////////////////////////     UIActionSheet     ///////////////////////////////////////////

@implementation UIActionSheet(UIHelper)

+ (void) showInView:(UIView *) view
              title:(NSString *) title
            buttons:(NSArray *) buttons
        cancelIndex:(NSInteger) cancelIndex
   destructiveIndex:(NSInteger) destructiveIndex
         completion:(void(^)(NSInteger buttonIndex)) block
{
    UIActionSheet *actionSheet = [[[UIActionSheet alloc] init] autorelease];
    actionSheet.delegate = [UIHelperDelegate shareUIHelperDelegate];
    
    if (block != nil)
    {
        objc_setAssociatedObject(actionSheet, UIActionSheetBlockKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    
    [actionSheet setTitle:title];
    
    for (NSString *btTitle in buttons)
    {
        [actionSheet addButtonWithTitle:btTitle];
    }
    
    [actionSheet setCancelButtonIndex:cancelIndex];
    [actionSheet setDestructiveButtonIndex:destructiveIndex];
    [actionSheet showInView:view];
}

+ (void) showFromToolbar:(UIToolbar *) view
                   title:(NSString *) title
                 buttons:(NSArray *) buttons
             cancelIndex:(NSInteger) cancelIndex
        destructiveIndex:(NSInteger) destructiveIndex
              completion:(void(^)(NSInteger buttonIndex)) block
{
    UIActionSheet *actionSheet = [[[UIActionSheet alloc] init] autorelease];
    actionSheet.delegate = [UIHelperDelegate shareUIHelperDelegate];
    
    if (block != nil)
    {
        objc_setAssociatedObject(actionSheet, UIActionSheetBlockKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    
    [actionSheet setTitle:title];
    
    for (NSString *btTitle in buttons)
    {
        [actionSheet addButtonWithTitle:btTitle];
    }
    
    [actionSheet setCancelButtonIndex:cancelIndex];
    [actionSheet setDestructiveButtonIndex:destructiveIndex];
    [actionSheet showFromToolbar:view];
}

+ (void) showFromTabBar:(UITabBar *) view
                  title:(NSString *) title
                buttons:(NSArray *) buttons
            cancelIndex:(NSInteger) cancelIndex
       destructiveIndex:(NSInteger) destructiveIndex
             completion:(void(^)(NSInteger buttonIndex)) block
{
    UIActionSheet *actionSheet = [[[UIActionSheet alloc] init] autorelease];
    actionSheet.delegate = [UIHelperDelegate shareUIHelperDelegate];
    
    if (block != nil)
    {
        objc_setAssociatedObject(actionSheet, UIActionSheetBlockKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    
    [actionSheet setTitle:title];
    
    for (NSString *btTitle in buttons)
    {
        [actionSheet addButtonWithTitle:btTitle];
    }
    
    [actionSheet setCancelButtonIndex:cancelIndex];
    [actionSheet setDestructiveButtonIndex:destructiveIndex];
    [actionSheet showFromTabBar:view];
}

+ (void) showFromRect:(CGRect) rect
               inView:(UIView *) view
             animated:(BOOL) animated
                title:(NSString *) title
              buttons:(NSArray *) buttons
          cancelIndex:(NSInteger) cancelIndex
     destructiveIndex:(NSInteger) destructiveIndex
           completion:(void(^)(NSInteger buttonIndex)) block
{
    UIActionSheet *actionSheet = [[[UIActionSheet alloc] init] autorelease];
    actionSheet.delegate = [UIHelperDelegate shareUIHelperDelegate];
    
    if (block != nil)
    {
        objc_setAssociatedObject(actionSheet, UIActionSheetBlockKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    
    [actionSheet setTitle:title];
    
    for (NSString *btTitle in buttons)
    {
        [actionSheet addButtonWithTitle:btTitle];
    }
    
    [actionSheet setCancelButtonIndex:cancelIndex];
    [actionSheet setDestructiveButtonIndex:destructiveIndex];
    [actionSheet showFromRect:rect inView:view animated:animated];
}

+ (void) showFromBarButtonItem:(UIBarButtonItem *) item
                      animated:(BOOL) animated
                         title:(NSString *) title
                       buttons:(NSArray *) buttons
                   cancelIndex:(NSInteger) cancelIndex
              destructiveIndex:(NSInteger) destructiveIndex
                    completion:(void(^)(NSInteger buttonIndex)) block
{
    UIActionSheet *actionSheet = [[[UIActionSheet alloc] init] autorelease];
    actionSheet.delegate = [UIHelperDelegate shareUIHelperDelegate];
    
    if (block != nil)
    {
        objc_setAssociatedObject(actionSheet, UIActionSheetBlockKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    
    [actionSheet setTitle:title];
    
    for (NSString *btTitle in buttons)
    {
        [actionSheet addButtonWithTitle:btTitle];
    }
    
    [actionSheet setCancelButtonIndex:cancelIndex];
    [actionSheet setDestructiveButtonIndex:destructiveIndex];
    [actionSheet showFromBarButtonItem:item animated:animated];
}

@end
