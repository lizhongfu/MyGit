//
//  ProgressBarDemoViewController.m
//  ProgressBarDemo
//
//  Created by xiangwei.ma on 2010/23/12.
//  Copyright 2010 Gigabud Limited. All rights reserved.
//

#import "ProgressBarDemoViewController.h"
#import "UIProgressBar.h"
@implementation ProgressBarDemoViewController



+ (NSString *)friendlyName {
    return @"UIProgressView自定义";
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    self.view.frame = BaseFrame;
	
	// default progress 
	UILabel *pLable = [[UILabel alloc] initWithFrame:CGRectMake( 0, 5, 95, 20)];
	pLable.text = @"default";
	[self.view addSubview:pLable];
	[pLable release];
	
	UIProgressBar *pProgress = [[UIProgressBar alloc] initWithFrame:CGRectMake( 100, 5, 200, 20)];	
	pProgress.minValue = 1;
	pProgress.maxValue = 10;
	pProgress.currentValue = 5;		
	[self.view addSubview:pProgress];	
	[pProgress release];	
	
	
	// colour progress 
	UILabel *pLable1 = [[UILabel alloc] initWithFrame:CGRectMake( 0, 30, 95, 20)];
	pLable1.text = @"colour";
	[self.view addSubview:pLable1];
	[pLable1 release];
	
	UIProgressBar *pProgress1 = [[UIProgressBar alloc] initWithFrame:CGRectMake(100, 30, 200, 20)];
	pProgress1.minValue = 1;
	pProgress1.maxValue = 10;
	pProgress1.currentValue = 5;	
	[pProgress1 setLineColor:[UIColor redColor]];	
	[pProgress1 setProgressColor:[UIColor blueColor]];	
	[pProgress1 setProgressRemainingColor:[UIColor yellowColor]];
	[self.view addSubview:pProgress1];	
	[pProgress1 release];	
	 
	 
	 // image progress 
	 UILabel *pLable2 = [[UILabel alloc] initWithFrame:CGRectMake( 0, 60, 95, 20)];
	 pLable2.text = @"image";
	 [self.view addSubview:pLable2];
	 [pLable2 release];
	 
	 UIProgressBar *pProgress2 = [[UIProgressBar alloc] initWithFrame:CGRectMake(100, 60, 200, 20)];
	 pProgress2.minValue = 1;
	 pProgress2.maxValue = 10;
	 pProgress2.currentValue = 5;	
	 [pProgress2 setLineColor:[UIColor whiteColor]];	
	 [pProgress2 setProgressColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]]];	
	 [pProgress2 setProgressRemainingColor:[UIColor blackColor]];
	 [self.view addSubview:pProgress2];	
	 [pProgress2 release];		 

    [super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning 
{
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
