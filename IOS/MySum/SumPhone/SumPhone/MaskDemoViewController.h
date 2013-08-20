//
//  MaskDemoViewController.h
//  MaskDemo
//
//  Created by shinren Pan on 2010/12/31.
//  Copyright 2010 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ImageSet.h"
#import "ViewBase.h"
typedef enum
{
	color,
	mask,
	frame
}testType;

@interface MaskDemoViewController : ViewBase <UIActionSheetDelegate>{
	UIImageView *imageView;
	testType type;
}
@property(nonatomic, retain) UIImageView *imageView;
-(void)test:(UIButton *)button;
@end

