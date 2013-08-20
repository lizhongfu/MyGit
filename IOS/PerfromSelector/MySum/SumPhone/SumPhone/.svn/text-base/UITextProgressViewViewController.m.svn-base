//
//  UIText_ProgressViewViewController.m
//  UIText_ProgressView
//
//  Created by 李 忠福 on 11-12-13.
//  Copyright 2011 通卡网络. All rights reserved.
//

#import "UITextProgressViewViewController.h"

@implementation UITextProgressViewViewController
@synthesize firstLabel, timer;


+ (NSString *)friendlyName {
    return @"UILabel字体颜色动态改变";
}

- (void) dddd {
	NSLog(@"aaaa");
	firstLabel.changeValue += 1;
	[firstLabel progressChange];
}

- (void) stop {
    [timer invalidate];
    timer = nil;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor whiteColor]];
	
	firstLabel = [[ZFLabel alloc] init];
    firstLabel.frame = CGRectMake(0, 240, 320, 80);
    firstLabel.backgroundColor = [UIColor clearColor];
    firstLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:35];
    firstLabel.text = @"整这个效果累死我了";
    firstLabel.gradientStartColor = [UIColor blueColor];
    firstLabel.gradientEndColor = [UIColor redColor];
    [self.view addSubview:firstLabel];
	
	
	//timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(dddd) userInfo:nil repeats:NO];
	timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dddd) userInfo:nil repeats:YES];
	
    [self performSelector:@selector(stop) withObject:nil afterDelay:3];
	
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	[firstLabel release];
    [super dealloc];
}

@end
