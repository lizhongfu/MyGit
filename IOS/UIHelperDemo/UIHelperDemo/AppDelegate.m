//
//  AppDelegate.m
//  UIHelperDemo
//
//  Created by Zogful.Lee on 13-4-23.
//  Copyright (c) 2013年 Lucky. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (void) btAction
{
    [UIActionSheet showInView:[UIApplication sharedApplication].keyWindow
                        title:@"title"
                      buttons:[NSArray arrayWithObjects:@"1", @"2", @"3", nil]
                  cancelIndex:0
             destructiveIndex:1
                   completion:^(NSInteger buttonIndex) {
                       NSLog(@"buttonIndex:%d", buttonIndex);
                   }];
    
    [UIAlertView showWithTitle:@"title"
                       message:@"message"
                       buttons:[NSArray arrayWithObjects:@"1", @"2", @"3", nil]
                    completion:^(NSInteger buttonIndex) {
                        NSLog(@"buttonIndex:%d", buttonIndex);
                    }];


}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor grayColor];
    self.window.rootViewController = viewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [viewController.view addSubview:button];
    button.frame = CGRectMake(50, 50, 100, 44);
    [button setTitle:@"alert view" forState:UIControlStateNormal];
    
    [button handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        
        [UIAlertView showWithTitle:@"title"
                           message:@"message"
                           buttons:[NSArray arrayWithObjects:@"1", @"2", @"3", nil]
                        completion:^(NSInteger buttonIndex) {
                            NSLog(@"buttonIndex:%d", buttonIndex);
                        }];
    }];
    
    
    //***************
    //***************
    GradientButton *button2 = [GradientButton buttonWithType:UIButtonTypeCustom];
    [button2 useRedDeleteStyle];
    [viewController.view addSubview:button2];
    button2.frame = CGRectMake(170, 50, 150, 44);
    [button2 setTitle:@"action sheet" forState:UIControlStateNormal];
    
    [button2 handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        [UIActionSheet showInView:[UIApplication sharedApplication].keyWindow
                            title:@"title"
                          buttons:[NSArray arrayWithObjects:@"1", @"2", @"3", nil]
                      cancelIndex:0
                 destructiveIndex:1
                       completion:^(NSInteger buttonIndex) {
                           NSLog(@"buttonIndex:%d", buttonIndex);
                       }];
    }];
    
    
    //***************
    
    UIView *aView = [UIView viewWithtouchesBegan:^(NSSet *touches, UIEvent *event) {
        NSLog(@"touchesBegan");
    } touchesMoved:^(NSSet *touches, UIEvent *event) {
        NSLog(@"touchesMoved");
    } touchesEnded:^(NSSet *touches, UIEvent *event) {
        NSLog(@"touchesEnded");
    } touchesCancelled:^(NSSet *touches, UIEvent *event) {
        NSLog(@"touchesCancelled");
    }];
    aView.frame = CGRectMake(150, 20, 100, 44);
    aView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:aView];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"1.gif" ofType:nil];
    SCGIFImageView* gifImageView = [[[SCGIFImageView alloc] initWithGIFFile:filePath] autorelease];
    gifImageView.frame = CGRectMake(300, 0, 44, 44);
    gifImageView.center = self.window.center;
    [self.window addSubview:gifImageView];
    
    
    //***************
    UISwitch *swithControl = [[UISwitch alloc] initWithFrame:CGRectMake(50, 10, 0, 0)];
    [viewController.view addSubview:swithControl];
    [swithControl handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
        UISwitch *s = sender;
        NSLog(@"value:%@",s.isOn?@"on":@"off");
    }];
    
    
    //***************
    //***************
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 110, 220, 0)];
    [viewController.view addSubview:slider];
    [slider handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
        UISlider *slider = sender;
        NSLog(@"slider:%f",slider.value);
    }];
    
    
    
    //***************
    //***************
    NSArray *items = [NSArray arrayWithObjects:@"item1",@"item2",@"item3", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:items];
    segment.frame = CGRectMake(50, 150, 220, 44);
    [viewController.view addSubview:segment];
    [segment handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
        UISegmentedControl *segment = sender;
        NSLog(@"segment change to %d",segment.selectedSegmentIndex);
    }];

    
    //***************
    //***************
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 244, 0, 0)];
    [viewController.view addSubview:datePicker];
    [datePicker handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
        UIDatePicker *picker = sender;
        NSLog(@"date:%@",picker.date);
    }];

    return YES;
}

@end
