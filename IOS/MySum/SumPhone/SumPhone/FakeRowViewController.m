//
//  FakeRowViewController.m
//  FakeRow
//
//  Created by Matt Long on 11/24/10.
//  Copyright 2010 Skye Road Systems, Inc. All rights reserved.
//

#import "FakeRowViewController.h"
#import "TitleCoverView.h"
#import <QuartzCore/QuartzCore.h>



@implementation FakeRowViewController

@synthesize slider;
@synthesize showXTranslationSlider;
@synthesize showZTranslationSlider;
@synthesize showYRotationSlider;
@synthesize startStopButton;

+ (NSString *)friendlyName {
    return @"3D动画";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    cover = [[TitleCoverView alloc] init];
    [[self view] addSubview:cover];
    
    [cover setCenter:CGPointMake(150.0f, 100.0f)];
    
    [cover performSelector:@selector(run) withObject:nil afterDelay:0.25];
}

- (IBAction)sliderMoved:(id)sender
{
    [cover stop];
    [[self startStopButton] setTitle:@"Start Animation" forState:UIControlStateNormal];
    [cover setOffset:[slider value]];
    
    [cover setShowYRotation:[showYRotationSlider isOn]];
    [cover setShowXTranslation:[showXTranslationSlider isOn]];
    [cover setShowZTranslation:[showZTranslationSlider isOn]];
    [cover updateTransform];
}

- (IBAction)startStop:(id)sender
{
    [cover toggleAnimation];
    if ([cover animationIsRunning])
        [[self startStopButton] setTitle:@"Stop Animation" forState:UIControlStateNormal];
    else
        [[self startStopButton] setTitle:@"Start Animation" forState:UIControlStateNormal];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)dealloc
{
    [cover release], cover = nil;
    [showYRotationSlider release], showYRotationSlider = nil;
    [showZTranslationSlider release], showZTranslationSlider = nil;
    [showXTranslationSlider release], showXTranslationSlider = nil;
    [slider release], slider = nil;
    [startStopButton release], startStopButton = nil;
    [super dealloc];
}

@end
