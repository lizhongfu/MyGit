//
//  DraggableImageViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DraggableImageViewController.h"

@interface DraggableImageViewController ()

@end

@implementation DraggableImageViewController

+ (NSString *)friendlyName {
    return @"UIImage可以拖拽";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
	
    DraggableImage *myView = [[[DraggableImage alloc] initWithImage:[UIImage imageNamed:@"20090218213158120.png"]] autorelease];
    myView.userInteractionEnabled = YES;
    
    [self.view addSubview:myView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
