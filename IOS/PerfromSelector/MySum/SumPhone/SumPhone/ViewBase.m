//
//  ViewBase.m
//  BaiduApprove
//
//  Created by Zogful Lee on 12-4-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewBase.h"

@implementation ViewBase

+ (NSString *)friendlyName {
    return @"hold string";
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
#if OUTPUT_ALLOC_MSG
		NSLog(@"[%@] - init", self);
#endif
    }
    return self;
}

- (void) loadView {
    
#if OUTPUT_ALLOC_MSG
    NSLog(@"[%@] - loadView", self);
#endif
    self.view = [[[UIView alloc] initWithFrame:BaseFrame] autorelease];
}


- (void)viewDidLoad
{
#if OUTPUT_ALLOC_MSG
	NSLog(@"[%@] - viewDidLoad", self);
#endif
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.722 green:1.000 blue:0.745 alpha:1];
}

- (void)viewDidUnload
{
#if OUTPUT_ALLOC_MSG
	NSLog(@"[%@] - viewDidUnload", self);
#endif
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


- (void) dealloc {
    
    [super dealloc];
}

@end
