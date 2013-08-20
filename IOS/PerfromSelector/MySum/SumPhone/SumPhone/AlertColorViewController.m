//
//  AlertColorViewController.m
//  AlertColor
//
//  Created by Bright Ming on 09-12-4.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AlertColorViewController.h"

@implementation AlertColorViewController

+ (NSString *)friendlyName {
    return @"UIAlert背景图片";
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIAlertView *theAlert = [[[UIAlertView alloc] initWithTitle:@"Atention"
														message: @"I'm a Chinese!"
													   delegate:nil 
											  cancelButtonTitle:@"Cancel" 
											  otherButtonTitles:@"Okay",nil] autorelease];
	
	[theAlert show];
	
	//*** undocumented API
//	UILabel *theTitle = [theAlert valueForKey:@"_titleLabel"];
//	[theTitle setTextColor:[UIColor greenColor]];
//	
//	UILabel *theBody = [theAlert valueForKey:@"_bodyTextLabel"];
//	[theBody setTextColor:[UIColor blueColor]];
	//***  undocumented API
	
	UIImage *theImage = [UIImage imageNamed:@"loveChina.png"];    
	theImage = [theImage stretchableImageWithLeftCapWidth:0. topCapHeight:0.];
	CGSize theSize = theAlert.layer.contentsRect.size;
//    [theAlert frame].size;
	
	UIGraphicsBeginImageContext(theSize);    
	[theImage drawInRect:CGRectMake(0, 0, theSize.width, theSize.height)];    
	theImage = UIGraphicsGetImageFromCurrentImageContext();    
	UIGraphicsEndImageContext();
    
    theAlert.layer.cornerRadius = 20;
    theAlert.layer.masksToBounds = YES;
	theAlert.layer.contents = (id)[theImage CGImage];
    
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
    [super dealloc];
}

@end
