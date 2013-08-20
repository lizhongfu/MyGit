    //
//  RootViewController.m
//  DeleteAnimationTest
//
//  Created by lixiaoxiao on 11-6-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PressToDeleteController.h"
#import "TestView.h"
#import <QuartzCore/QuartzCore.h>

#define IMAGE_GAP 30
#define MaxTagNumber 999

/////////////////////////////////////////////////////////////////
static const CGFloat kWobbleRadians = 1.5;
static const NSTimeInterval kWobbleTime = 0.07;
/////////////////////////////////////////////////////////////////

@implementation PressToDeleteController

@synthesize viewDataArray;
@synthesize cardsViewCenterArray;
@synthesize buttonViewCenterArray;

@synthesize shakeViewTimer;


+ (NSString *)friendlyName {
    return @"长按抖动删除";
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationController.navigationBar.hidden = NO;
	
	scrollView = [[UIScrollView alloc] initWithFrame:BaseFrame];
	scrollView.alwaysBounceVertical = YES;
	scrollView.alwaysBounceHorizontal = NO;
	scrollView.tag = MaxTagNumber;//防止删除子视图时将scrollView删掉
//	scrollView.delegate = self;
	[self.view addSubview:scrollView];
	
	viewDataArray = [[NSMutableArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", nil];
	cardsViewCenterArray = [[NSMutableArray alloc] init];
	buttonViewCenterArray = [[NSMutableArray alloc] init];
	[self initCardsView];
}

- (void)initCardsView {
//	NSInteger theCount = 13;
	NSInteger theCount = [viewDataArray count];
	NSUInteger countPage = ((theCount%4) == 0) ? (theCount/4) : (theCount/4 + 1);//三页
	CGFloat scrollWidth = scrollView.bounds.size.width;
	CGFloat scrollHeight = scrollView.bounds.size.height;
	scrollView.contentSize = CGSizeMake(scrollWidth, scrollHeight*countPage);
	CGFloat imageWidth = (scrollWidth - 3*IMAGE_GAP)/2;
	CGFloat imageHeight = (scrollHeight - 3*IMAGE_GAP)/2;
	CGFloat x = IMAGE_GAP;
	CGFloat y = IMAGE_GAP;
	int index = 0;
	int currentPage = 0;
	TestView *testView = nil;
	for (NSString *theItem in viewDataArray) {
		testView = [[TestView alloc] initWithFrame:CGRectMake(x, y, imageWidth, imageHeight) withNumber:[theItem intValue]];
//		testView = [[TestView alloc] initWithFrame:CGRectMake(x, y, 50, 50) withNumber:[theItem intValue]];
		testView.backgroundColor = [UIColor whiteColor];
		
		UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
		longPressRecognizer.allowableMovement = 30;
		[testView addGestureRecognizer:longPressRecognizer];        
		[longPressRecognizer release];
		testView.tag = [theItem intValue];
		[scrollView addSubview:testView];
		NSValue *tempValue = [NSValue valueWithCGPoint:testView.center];
		[cardsViewCenterArray addObject:tempValue];
		[testView release];
		
		index ++;
		x += IMAGE_GAP + imageWidth;
		if (index % 4 == 0) {
			currentPage ++;
			x = IMAGE_GAP;
			y = currentPage*scrollHeight +IMAGE_GAP;
		}
		else if (index % 2 == 0) {
			x = IMAGE_GAP;
			y += IMAGE_GAP + imageHeight;
		}
	}
}

#pragma mark -
#pragma mark Handling long presses
- (void)handleLongPress:(UILongPressGestureRecognizer*)longPressRecognizer {
	if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
		[self addDeleteView];
//		[self startTimer];
		
		UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(stopShake)];
		[self.navigationItem setRightBarButtonItem:doneButtonItem];
		[doneButtonItem release];
		
		isShake = YES;
		[self wobble];
	}
}

- (void)addDeleteView {
//	NSInteger theCount = 13;
//	NSUInteger countPage = ((theCount%4) == 0) ? (theCount/4) : (theCount/4 + 1);
//	CGFloat scrollWidth = scrollView.bounds.size.width;
//	CGFloat scrollHeight = scrollView.bounds.size.height;
//	scrollView.contentSize = CGSizeMake(scrollWidth, scrollHeight*countPage);
//	CGFloat imageWidth = (scrollWidth - 3*IMAGE_GAP)/2;
//	CGFloat imageHeight = (scrollHeight - 3*IMAGE_GAP)/2;
//	CGFloat x = IMAGE_GAP;
//	CGFloat y = IMAGE_GAP + imageHeight/2;
//	int index = 0;
//	int currentPage = 0;
//	UIButton *deleteButton = nil;
//	for (int i = 0; i < theCount; i++) {
//		deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, 50, 50)];
//		[deleteButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
//		deleteButton.tag = i;
//		[scrollView addSubview:deleteButton];
//		[deleteButton release];
//		
//		index ++;
//		x += IMAGE_GAP + imageWidth;
//		if (index % 4 == 0) {
//			currentPage ++;
//			x = IMAGE_GAP;
//			y = currentPage*scrollHeight +IMAGE_GAP + imageHeight/2;
//		}
//		else if (index % 2 == 0) {
//			x = IMAGE_GAP;
//			y += IMAGE_GAP + imageHeight;
//		}
//	}
	
	UIButton *deleteButton = nil;
	for (UIView *tempView in scrollView.subviews) {
		if ([tempView isKindOfClass:[TestView class]]) {
			deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(tempView.frame.origin.x - 10,
																	  tempView.frame.origin.y + tempView.frame.size.height/2 - 25,
																	  50, 50)];
			[deleteButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
			deleteButton.imageView.tag = tempView.tag;
			deleteButton.tag = tempView.tag;
			[deleteButton addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
			[scrollView addSubview:deleteButton];
			NSValue *tempValue = [NSValue valueWithCGPoint:deleteButton.center];
			[buttonViewCenterArray addObject:tempValue];
			[deleteButton release];
		}
	}
}

#pragma mark -
#pragma mark deleteButtonEvent
- (void)delete:(UIButton *)sender {
//	NSArray *tempArray = [NSArray arrayWithArray:viewDataArray];
//	for (NSString *theItem in tempArray) {
//		NSLog(@"%@", theItem);
//		if ([theItem isEqualToString:[NSString stringWithFormat:@"%d", sender.tag]]) {
//			[viewDataArray removeObject:theItem];
//		}
//	}
//	for (UIView *subView in [scrollView subviews]) {
//		[subView removeFromSuperview];
//	}
//	[self initCardsView];
//	[self addDeleteView];
	
//	UIView *tempView = [scrollView viewWithTag:sender.tag];
//	[tempView removeFromSuperview];
//	UIView *tempButtonView = [scrollView viewWithTag:sender.tag];
//	[tempButtonView removeFromSuperview];
	
	NSMutableArray *tempCardsViewArray = [NSMutableArray arrayWithArray:cardsViewCenterArray];
	NSMutableArray *tempButtonViewArray = [NSMutableArray arrayWithArray:buttonViewCenterArray];
	
	[UIView beginAnimations:@"movement" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDuration:1.0f];
	
	UIView *tempView = nil;
	do {
		tempView = [scrollView viewWithTag:sender.tag];
		[tempView removeFromSuperview];
	} while (tempView);
	
	CGPoint tempViewCenter;
	int testViewIndex = 0;
	int buttonViewIndex = 0;
	for (tempView in [scrollView subviews]) {
		if ([tempView isKindOfClass:[TestView class]]) {
			tempViewCenter = [[tempCardsViewArray objectAtIndex:testViewIndex] CGPointValue];
			testViewIndex ++;
		} else if ([tempView isKindOfClass:[UIButton class]]) {
			tempViewCenter = [[tempButtonViewArray objectAtIndex:buttonViewIndex] CGPointValue];
			buttonViewIndex ++;
		}
		tempView.center = tempViewCenter;
	}
	[UIView commitAnimations];
}

- (void)shakeView {
//	UIView *tempView = nil;
//	for (tempView in [scrollView subviews]) {
////		CGFloat randomNumber = -0.01 + arc4random()%201/10000.0;
////		CGAffineTransform transform = tempView.transform;
////		if ([tempView isKindOfClass:[UIButton class]]) {
////			tempView.center = CGPointMake(tempView.center.x + 230, tempView.center.y);
////		}
////		transform = CGAffineTransformRotate(transform, randomNumber);
////		tempView.transform = transform;
//		
//		if ([tempView isKindOfClass:[UIButton class]]) {
//			NSValue *value = nil;
//			CABasicAnimation *animation = nil;
//			CATransform3D transform;
//			animation = [CABasicAnimation animationWithKeyPath:@"transform"];
//			transform = CATransform3DMakeRotation(2.57f, 0.0f, 0.0f, 1.0f);
//			value = [NSValue valueWithCATransform3D:transform];
//			[animation setToValue:value];
//			transform = CATransform3DMakeRotation(0.0f, 0.0f, 0.0f, 1.0f);
//			value = [NSValue valueWithCATransform3D:transform];
//			[animation setFromValue:value];
//			[animation setAutoreverses:YES];
//			[animation setDuration:1.0f];
//			[tempView.layer addAnimation:animation forKey:@"kScaleKey"];
//		}
//	}
}

- (void)wobble {
	static BOOL wobblesLeft = NO;
	
	if (isShake) {
		CGFloat rotation = (kWobbleRadians * M_PI) / 180.0;
		CGAffineTransform wobbleLeft = CGAffineTransformMakeRotation(rotation);
		CGAffineTransform wobbleRight = CGAffineTransformMakeRotation(-rotation);
		
		[UIView beginAnimations:nil context:nil];
		
		NSInteger i = 0;
		NSInteger nWobblyButtons = 0;
//		for (NSArray* buttonPage in _buttons) {
//			for (TTLauncherButton* button in buttonPage) {
//				if (button != _dragButton) {
//					++nWobblyButtons;
//					if (i % 2) {
//						button.transform = wobblesLeft ? wobbleRight : wobbleLeft;
//						
//					} else {
//						button.transform = wobblesLeft ? wobbleLeft : wobbleRight;
//					}
//				}
//				++i;
//			}
//		}
		
		for (UIView *tempView in [scrollView subviews]) {
			if ([tempView isKindOfClass:[TestView class]] || [tempView isKindOfClass:[UIButton class]]) {
				++nWobblyButtons;
				if (i % 2) {
					tempView.transform = wobblesLeft ? wobbleRight : wobbleLeft;
				} else {
					tempView.transform = wobblesLeft ? wobbleLeft : wobbleRight;
				}
				++i;
			}
		}
		
		if (nWobblyButtons >= 1) {
			[UIView setAnimationDuration:kWobbleTime];
			[UIView setAnimationDelegate:self];
			[UIView setAnimationDidStopSelector:@selector(wobble)];
			wobblesLeft = !wobblesLeft;
			
		} else {
			[NSObject cancelPreviousPerformRequestsWithTarget:self];
			[self performSelector:@selector(wobble) withObject:nil afterDelay:kWobbleTime];
		}
		
		[UIView commitAnimations];
	}
}

- (void)startTimer {
	isShake = YES;
	if (shakeViewTimer == nil) {
		shakeViewTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self
														selector:@selector(wobble) userInfo:nil repeats:NO];
	}
}

- (void)stopShake {
	isShake = NO;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3f];
//	[UIView setAnimationDelegate:self];
	
	for (UIView *tempView in [scrollView subviews]) {
		tempView.transform = CGAffineTransformIdentity;
	}
	[UIView commitAnimations];
	
	for (UIView *tempView in [scrollView subviews]) {
		if ([tempView isKindOfClass:[UIButton class]]) {
			[tempView removeFromSuperview];
		}
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[shakeViewTimer invalidate];
	[shakeViewTimer release];
	
	[scrollView release];
	[viewDataArray release];
	[cardsViewCenterArray release];
	[buttonViewCenterArray release];
	
    [super dealloc];
}


@end
