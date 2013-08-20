//
//  cloudViewController.m
//  cloud
//
//  Created by lee jory on 09-11-27.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "cloudViewController.h"
#import "BGMovingComponent.h"

@implementation cloudViewController

+ (NSString *)friendlyName {
    return @"云朵飘动";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = BaseFrame;
    
	BGMovingComponent *cloud = [[BGMovingComponent alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
	[self.view addSubview:cloud];
}
 
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
