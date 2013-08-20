//
//  PowerImageViewController.h
//  SumPhone
//
//  Created by Zogful Lee on 12-7-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewBase.h"
#import "ZFNavigationBar.h"
#import "ZFScrollView.h"
#import "ImageUtil.h"
#import "ColorMatrix.h"
#import "UIImage-Extensions.h"
#import <math.h>
#import "SSPhotoCropperViewController.h"

@protocol ProcessingImageViewDelegate;

@interface ProcessingImageView : UIImageView
{
	id <ProcessingImageViewDelegate> delegate;
}

@property (assign) id <ProcessingImageViewDelegate> delegate;

@end

@protocol ProcessingImageViewDelegate
-(void)tapOnCallback:(ProcessingImageView*)imageView;
@end


@interface PowerImageViewController : ViewBase <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ProcessingImageViewDelegate, SSPhotoCropperDelegate> {
    
    BOOL show;
}

@property (nonatomic, retain) ZFNavigationBar *navBar;
@property (nonatomic, retain) ZFScrollView *bottomScroll;
@property (nonatomic, retain) UITableView *effectSelect;//色彩效果
@property (nonatomic, retain) UITableView *translateSelect;//框架效果
@property (nonatomic, retain) NSMutableArray *effectSelectData;//色彩效果数据
@property (nonatomic, retain) NSMutableArray *translateSelectData;//框架效果数据
@property (nonatomic, retain) UIImagePickerController *imagePickerController;
@property (nonatomic, retain) UIImage *currentImage;
@property (nonatomic, retain) ProcessingImageView *imageV;

@end
