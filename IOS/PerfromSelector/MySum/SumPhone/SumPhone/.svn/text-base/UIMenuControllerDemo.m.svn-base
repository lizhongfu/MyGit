//
//  UIMenuControllerDemo.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIMenuControllerDemo.h"

@interface UIMenuControllerDemo ()

@end

@implementation UIMenuControllerDemo

+ (NSString *)friendlyName {
    return @"UIMenuControllerDemo";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
	
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressWebView:)];
    [longPressGesture setDelegate:self];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	CGPoint point = [[touches anyObject] locationInView:self.view];
    
    [self showMenu:point];
}

-(void)longPressWebView:(UILongPressGestureRecognizer *)gestureRecognizer{
    NSLog(@"[%s]",__FUNCTION__);
//	if ([gestureRecognizer state]==UIGestureRecognizerStateEnded) 
//    {
        CGPoint menuPoint = [gestureRecognizer locationInView:self.view];
        [self showMenu:menuPoint];
//	}
}

-(void)showMenu:(CGPoint)point
{
    if( ![self becomeFirstResponder] )
    {
        NSLog(@"Couldn't become first responder ");
        return;
    }
    
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    [menuController setMenuVisible:NO];
    
    UIMenuItem *menuItem1 = [[UIMenuItem alloc] initWithTitle:@"备注" action:@selector(menuItem:)];
    UIMenuItem *menuItem2 = [[UIMenuItem alloc] initWithTitle:@"翻译" action:@selector(menuItem:)];
    UIMenuItem *menuItem3 = [[UIMenuItem alloc] initWithTitle:@"more..." action:@selector(menuItem3:)];
    [menuController setMenuItems:[NSArray arrayWithObjects:menuItem1,menuItem2,menuItem3,nil]];
    
    [menuController setTargetRect:CGRectMake(point.x, point.y, 0, 0) inView:self.view];
    [menuController setMenuVisible:YES animated:YES];
    
    [menuItem1 release];
    [menuItem2 release];
    [menuItem3 release];	
    
}

-(void)menuItem:(id)sender
{
    NSLog(@"%@",sender);
}

-(void)noteMenuAct:(UIMenuController *)controller{
    NSLog(@"[%s]",__FUNCTION__);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
	return YES;
}

@end
