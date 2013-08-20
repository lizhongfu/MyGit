//
//  ResetIconPositionViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ResetIconPositionViewController.h"

#define kAnimationDuration (0.35f)
#define kScaleFactory (1.25f)

@interface ResetIconPositionViewController ()

@property (nonatomic, retain) NSMutableArray *labels;
@property (nonatomic, assign) UILabel *selectedLabel;
@property (nonatomic, assign) CGPoint selectedLabelOriginCenter;
@property (nonatomic, assign) CGPoint offset;

@end

@implementation ResetIconPositionViewController

@synthesize labels = _labels;
@synthesize selectedLabel = _selectedLabel;
@synthesize selectedLabelOriginCenter = _selectedLabelOriginCenter;
@synthesize offset = _offset;

+ (NSString *)friendlyName {
    return @"重新排列图标";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.selectedLabelOriginCenter = CGPointZero;
	self.offset = CGPointZero;
	
	char const counter = 16;
	// 设置图标所使用的位置
	CGPoint locations[counter] = {
		{40,  40}, {120,  40}, {200,  40}, {280,  40}, 
		{40, 120}, {120, 120}, {200, 120}, {280, 120}, 
		{40, 200}, {120, 200}, {200, 200}, {280, 200}, 
		{40, 280}, {120, 280}, {200, 280}, {280, 280}
	};
	
	// 设置图标(使用label作为图标)
	NSMutableArray *ma = [[NSMutableArray alloc] initWithCapacity:counter];
	for (char idx = 0; idx < counter; idx++) {
		UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
		[label setText:(idx > 9) ? [NSString stringWithFormat:@"%d", idx] : [NSString stringWithFormat:@"0%d", idx]];
		[label setTextAlignment:UITextAlignmentCenter];

		[label setBackgroundColor:[UIColor colorWithRed:0x80 / 255.0f green:0x80 / 255.0f blue:0.0f alpha:1.0f]];
		[label setCenter:locations[idx]];
		[self.view addSubview:label];
		
		[ma addObject:label];
	}
	self.labels = ma;
	[ma release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
	[_labels removeAllObjects];
	[_labels release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// 放大指定label的尺寸
- (void)zoomInLabel:(UILabel *)label {
	if (label) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveLinear];
		[UIView setAnimationDuration:kAnimationDuration];
		label.transform = CGAffineTransformMakeScale(kScaleFactory, kScaleFactory);
		[UIView commitAnimations];
	}
}

// 恢复指定label的尺寸
- (void)zoomOutLabel:(UILabel *)label {
	if (label) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveLinear];
		[UIView setAnimationDuration:kAnimationDuration];
		label.transform = CGAffineTransformIdentity;
		[UIView commitAnimations];		
	}
}

// 寻找被选中的图标
- (UILabel *)findSelectedLabel:(CGPoint)touchedPoint {
	for (UILabel *label in self.labels) {
		if (CGRectContainsPoint(label.frame, touchedPoint)) {
			// 获取触摸位置与被选中图标中心点之间的偏移
			self.offset = CGPointMake((touchedPoint.x - label.center.x), (touchedPoint.y - label.center.y));
			return label;
		}
	}
	return nil;
}

// 寻找包含被选中图标中心点的图标(非被选中图标)
- (UILabel *)findLabelContainsSelectedLabelCenter {
	for (UILabel *label in self.labels) {
		if (label != self.selectedLabel) {
			if (CGRectContainsPoint(label.frame, self.selectedLabel.center)) {
				return label;
			}
		}
	}
	return nil;
}

// 交换
- (void)exchangeSelectedLabel:(UILabel *)selectedLabel betweenLabel:(UILabel *)destLabel {
	if (selectedLabel && destLabel) {
		int idx1 = [self.labels indexOfObject:selectedLabel];
		int idx2 = [self.labels indexOfObject:destLabel];
		CGPoint newPoint = self.selectedLabelOriginCenter;
		if (idx1 < idx2) {
			// 先移动前面的，再移动后面的
			for (char idx = idx1+1; idx < idx2+1; idx++) {
				[UIView beginAnimations:nil context:nil];
				[UIView setAnimationCurve:UIViewAnimationCurveLinear];
				[UIView setAnimationDuration:kAnimationDuration];
				CGPoint oldPoint = ((UILabel *)[self.labels objectAtIndex:idx]).center;
				((UILabel *)[self.labels objectAtIndex:idx]).center = newPoint;//把移动目标的位置给他的下个元素
				newPoint = oldPoint;
				[UIView commitAnimations];
				[self.labels exchangeObjectAtIndex:idx withObjectAtIndex:idx-1];
			}
		} 
        else {
			// 先移动后面的，再移动前面的
			for (char idx = idx1-1; idx > idx2-1; idx--) {
				[UIView beginAnimations:nil context:nil];
				[UIView setAnimationCurve:UIViewAnimationCurveLinear];
				[UIView setAnimationDuration:kAnimationDuration];
				CGPoint oldPoint = ((UILabel *)[self.labels objectAtIndex:idx]).center;
				((UILabel *)[self.labels objectAtIndex:idx]).center = newPoint;
				newPoint = oldPoint;
				[UIView commitAnimations];	
				[self.labels exchangeObjectAtIndex:idx withObjectAtIndex:idx+1];
			}
		}
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveLinear];
		[UIView setAnimationDuration:kAnimationDuration];
		selectedLabel.center = newPoint;
		[UIView commitAnimations];
	} else if (selectedLabel && !destLabel) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveLinear];
		[UIView setAnimationDuration:kAnimationDuration];
		selectedLabel.center = self.selectedLabelOriginCenter;
		[UIView commitAnimations];
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesBegan:touches withEvent:event];
	
	UITouch *touch = [touches anyObject];
	CGPoint touchedLoc = [touch locationInView:self.view];
	self.selectedLabel = [self findSelectedLabel:touchedLoc];// 寻找选中的图标
	self.selectedLabelOriginCenter = self.selectedLabel.center;
	[self zoomInLabel:self.selectedLabel];// 放大选中的图标
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesCancelled:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesEnded:touches withEvent:event];
	
	if (self.selectedLabel) {
		[self zoomOutLabel:self.selectedLabel];// 恢复选中的图标
		UILabel *destLabel = [self findLabelContainsSelectedLabelCenter];
		[self exchangeSelectedLabel:self.selectedLabel betweenLabel:destLabel];
		self.selectedLabel = nil;
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesMoved:touches withEvent:event];
	
	if (self.selectedLabel) {
		UITouch *touch = [touches anyObject];
		CGPoint touchedLoc = [touch locationInView:self.view];
		CGFloat newX = touchedLoc.x - self.offset.x;
		CGFloat newY = touchedLoc.y - self.offset.y;
		self.selectedLabel.center = CGPointMake(newX, newY);
	}
}

@end
