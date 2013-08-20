//
//  TitleCoverView.h
//  FakeRow
//
//  Created by Matt Long on 11/25/10.
//  Copyright 2010 Skye Road Systems, Inc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface TitleCoverView : UIView

@property (assign) CGFloat offset;

@property (assign) BOOL showXTranslation;
@property (assign) BOOL showZTranslation;
@property (assign) BOOL showYRotation;
@property (assign) BOOL showImage;
@property (assign) BOOL showReflection;
@property (assign) BOOL showRoundCorners;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) CALayer *reflectionLayer;

- (CATransform3D)startingTransform;
- (CATransform3D)currentTransform;
- (CATransform3D)transformForOffsetLinear:(CGFloat)off;
- (CATransform3D)transformForOffsetCustom:(CGFloat)off;
- (void)updateTransform;
- (void)run;
- (void)stop;
- (BOOL)animationIsRunning;
- (void)toggleAnimation;
- (CAAnimation*)animation;

- (UIColor*)randomColor;

@end
