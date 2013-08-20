//
//  RootViewController.m
//  TestSocket
//
//  Created by Zogful.Lee on 13-8-18.
//  Copyright (c) 2013年 Lucky. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SocketHelper *socket = [SocketHelper new];
    [socket socketOpen:@"user.api.kalagame.com" port:9080];
}


@end
