//
//  UITextViewDemoViewController.h
//  UITextViewDemo
//
//  Created by Zogful Lee on 11-9-16.
//  Copyright 2011 sina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewBase.h"

@interface UITextViewDemoViewController : ViewBase <UITextViewDelegate>{
	UITextView *myTextView;
}

@property (nonatomic, retain) UITextView *myTextView;
@end

