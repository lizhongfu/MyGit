//
//  RootViewController.h
//  DeleteAnimationTest
//
//  Created by lixiaoxiao on 11-6-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewBase.h"


@interface PressToDeleteController : ViewBase {
	UIScrollView *scrollView;
	NSMutableArray *viewDataArray;
	NSMutableArray *cardsViewCenterArray;
	NSMutableArray *buttonViewCenterArray;
	
	NSTimer *shakeViewTimer;
	BOOL isShake;
}

@property (nonatomic, retain) NSMutableArray *viewDataArray;
@property (nonatomic, retain) NSMutableArray *cardsViewCenterArray;
@property (nonatomic, retain) NSMutableArray *buttonViewCenterArray;

@property (nonatomic, retain, readonly) NSTimer *shakeViewTimer;

- (void)initCardsView;
- (void)addDeleteView;
- (void)shakeView;
- (void)startTimer;
- (void)stopShake;
- (void)wobble;
@end
