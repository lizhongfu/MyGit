//
//  RootViewController.m
//  AssociativeDemo
//
//  Created by Zogful.Lee on 13-4-10.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RootViewController.h"
#import <objc/runtime.h>

static char associativekey;
static char associativeAlertkey;

@interface RootViewController ()
{
    NSObject *obj_one;
    NSObject *obj_two;
}

@end

@implementation RootViewController

- (void) dealloc
{
    self.textField = nil;
    [obj_one release];
    [obj_two release];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        obj_one = [NSObject new];
        obj_two = [[NSString alloc] initWithFormat:@"额，被发现了⋯⋯"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对象关联"
                                                    message:@"点击确定后，与Alert关联的NSString已经显示在UITextField中"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles: nil];
    
    objc_setAssociatedObject(alert, &associativeAlertkey, @"一个与alert关联的字符串", OBJC_ASSOCIATION_RETAIN);
    
    [alert show];
    [alert release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) buildAssociative
{
    objc_setAssociatedObject(obj_one, &associativekey, obj_two, OBJC_ASSOCIATION_RETAIN);
}

- (IBAction) getAssociativeValue
{
    id associativeObj = objc_getAssociatedObject(obj_one, &associativekey);
    self.textField.text = associativeObj;
}


/*
 要断开关联，你可以调用 objc_setAssociatedObject, 传一个 nil。
 关联的对象被设置为了 nil, 至于原则项这里都不重要。
 要断开一个对象的所有关联，你可以调用 objc_removeAssociatedObjects。
 通常来说，不应该使用这个方法，因为它会对所有的客户断开所有关联。只有当你想把一个对象重置到初始化状态时再使用这个方法。
 */
- (IBAction) cutAssociative
{
    objc_setAssociatedObject(obj_one, &associativekey, nil, OBJC_ASSOCIATION_RETAIN);
    [self getAssociativeValue];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    id associativeObj = objc_getAssociatedObject(alertView, &associativeAlertkey);
    self.textField.text = associativeObj;
}

@end
