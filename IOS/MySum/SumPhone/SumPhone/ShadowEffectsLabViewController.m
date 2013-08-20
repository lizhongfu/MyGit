//
//  ShadowEffectsLabViewController.m
//  ShadowEffectsLab
//
//  Created by Matt Long on 10/15/10.
//  Copyright 2010 Skye Road Systems, Inc. All rights reserved.
//



#import "ShadowEffectsLabViewController.h"

@implementation ShadowEffectsLabViewController

+ (NSString *)friendlyName {
    return @"UILayer背景使用方法";
}

- (void)dealloc
{
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    self.view.backgroundColor = [UIColor blueColor];
    
    width = BaseFrame.size.width;
    height = BaseFrame.size.height;
    
    [self addStandardDropShadowLayer];
    [self addGlowLayer];
    [self addBevelLayer];
    [self addBlurLayer];
}



- (void)addStandardDropShadowLayer;
{
    CALayer *dropShadowLayer = [CALayer layer];
    [dropShadowLayer setBounds:CGRectMake(0.0f, 0.0f, width/3, height/3)];
    [dropShadowLayer setPosition:CGPointMake(width/5, height/5)];
    [dropShadowLayer setBackgroundColor:[[UIColor whiteColor] CGColor]];
    [dropShadowLayer setBorderWidth:1.0f];
    [dropShadowLayer setShadowOpacity:0.75];
    [[[self view] layer] addSublayer:dropShadowLayer];
}

- (void)addGlowLayer;
{
    CALayer *glowLayer = [CALayer layer];
    [glowLayer setBounds:CGRectMake(0.0f, 0.0f, width/3, height/3)];
    [glowLayer setPosition:CGPointMake(4*width/5, height/5)];
    [glowLayer setBackgroundColor:[[UIColor whiteColor] CGColor]];
    [glowLayer setBorderWidth:1.0f];
    [glowLayer setShadowOpacity:1.0];
    [glowLayer setShadowRadius:10.0f];
    [glowLayer setShadowColor:[[UIColor orangeColor] CGColor]];
    [glowLayer setShadowPath:[[UIBezierPath bezierPathWithRect:CGRectMake(-5.0f, -5.0f, width/3+10, height/3+10)] CGPath]];
    
    [[[self view] layer] addSublayer:glowLayer];
}

- (void)addBevelLayer;
{
    CALayer *bevelLayer = [CALayer layer];
    [bevelLayer setBounds:CGRectMake(0.0f, 0.0f, width/3, height/3)];
    [bevelLayer setPosition:CGPointMake(width/5, 3*height/5)];
    [bevelLayer setBackgroundColor:[[UIColor whiteColor] CGColor]];
    [bevelLayer setShadowOpacity:1.0];
    [bevelLayer setShadowRadius:7.0f];
    [bevelLayer setShadowColor:[[UIColor colorWithRed:0.0f/255.0 green:126.0f/255.0f blue:255.0f/255.0f alpha:1.0f] CGColor]];
    [bevelLayer setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(-10.0f, -10.0f, width/3+10, height/3+10) cornerRadius:12.0f] CGPath]];
    
    [[[self view] layer] addSublayer:bevelLayer];
}

- (void)addBlurLayer;
{
    CALayer *backingLayer = [CALayer layer];
    [backingLayer setBounds:CGRectMake(0.0f, 0.0f, width/3, height/3)];
    [backingLayer setPosition:CGPointMake(3*width/5+30, 3*height/5)];
    [backingLayer setContents:(id)[[UIImage imageNamed:@"willow.jpg"] CGImage]];
    [backingLayer setContentsGravity:kCAGravityResizeAspectFill];
    
    CALayer *spotLightLayer = [CALayer layer];
    [spotLightLayer setBounds:CGRectMake(0.0f, 0.0f, 300.0f, 300.0f)];
    [spotLightLayer setPosition:CGPointMake([spotLightLayer bounds].size.width / 2.0f, [spotLightLayer bounds].size.height / 2.0f)];
    [spotLightLayer setShadowOpacity:1.0];
    [spotLightLayer setShadowRadius:20.0f];
    [spotLightLayer setShadowOpacity:0.25];
    [spotLightLayer setShadowColor:[[UIColor whiteColor] CGColor]];
    [spotLightLayer setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(-5.0f, -5.0f, width/3+10, height/3+10) cornerRadius:155.0f] CGPath]];
    
    [backingLayer addSublayer:spotLightLayer];
    [[[self view] layer] addSublayer:backingLayer];
    
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    [anim setFromValue:[NSValue valueWithCGPoint:CGPointMake(40.0f, [spotLightLayer bounds].size.height / 2.0f)]];
    [anim setToValue:[NSValue valueWithCGPoint:CGPointMake(240.0f, [spotLightLayer bounds].size.height / 2.0f)]];
    [anim setDuration:2.0f];
    [anim setAutoreverses:YES];
    [anim setRepeatCount:HUGE_VAL];
    
    [spotLightLayer addAnimation:anim forKey:@"position"];
}


@end
