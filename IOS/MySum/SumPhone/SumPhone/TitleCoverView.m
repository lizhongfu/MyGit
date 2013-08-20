//
//  TitleCoverView.m
//  FakeRow
//
//  Created by Matt Long on 11/25/10.
//  Copyright 2010 Skye Road Systems, Inc. All rights reserved.
//

#import "TitleCoverView.h"

#define kMinZTransform -500.0f
#define kMaxZTransform 100.0f
#define kMinXTransform -600.0f
#define kMaxXTransform 200.0f
#define kMinYRotation 0.0f
#define kMaxYRotation 25.0f

#ifdef DEBUG
#define DLog(...) NSLog(@"%s(%x) %@", __PRETTY_FUNCTION__, self, [NSString stringWithFormat:__VA_ARGS__])
#define ALog(...) [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__]
#else
#define DLog(...) do { } while (0)
#ifndef NS_BLOCK_ASSERTIONS
#define NS_BLOCK_ASSERTIONS
#endif
#define ALog(...) NSLog(@"%s(%x) %@", __PRETTY_FUNCTION__, self, [NSString stringWithFormat:__VA_ARGS__])
#endif

#define ZAssert(condition, ...) do { if (!(condition)) { ALog(__VA_ARGS__); }} while(0)

#define degreesToRadians(x) (M_PI * x / 180.0)

@implementation TitleCoverView

@synthesize offset;
@synthesize showXTranslation;
@synthesize showZTranslation;
@synthesize showYRotation;
@synthesize showImage;
@synthesize showReflection;
@synthesize showRoundCorners;
@synthesize image;
@synthesize reflectionLayer;

static CGFloat rotations[] = { 20.0f, 15.0f, 10.0f, 5.0f, 0.0f, 5.0f, 15.0f, 20.0f, 25.0f, 25.0f };

- (id)init
{    
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 200.0f)];
    if (!self) return nil;
    
    [[self layer] setTransform:[self startingTransform]];
    
    [self setBackgroundColor:[self randomColor]];
    [[self layer] setBorderColor:[[self randomColor] CGColor]];
    [[self layer] setBorderWidth:4.0f];
    
    [self setImage:[UIImage imageNamed:@"megamind.jpg"]];
    
    [self setShowYRotation:YES];
    [self setShowXTranslation:YES];
    [self setShowZTranslation:YES];
    [self setShowImage:YES];
    [self setShowReflection:NO];
    
    CALayer *l = [CALayer layer];
    [l setBounds:[self bounds]];
    [l setBackgroundColor:[[UIColor orangeColor] CGColor]];
    [l setBorderColor:[[UIColor greenColor] CGColor]];
    [l setPosition:CGPointMake([self bounds].size.width / 2.0f, [self bounds].size.height + 10.0f)];
    [l setAnchorPoint:CGPointMake(0.5, 1.0)];
    [l setOpacity:0.85];
    [l setContents:(id)[image CGImage]];
   
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setBounds:CGRectMake(0.0f, 
                                        0.0f, 
                                        [l bounds].size.width, 
                                        [l bounds].size.height)];
    
    [gradientLayer setPosition:CGPointMake([l bounds].size.width/2.0, 
                                           [l bounds].size.height)];
    
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor blueColor] CGColor], nil]];
    
    [l setMask:gradientLayer];
    
    CATransform3D trans = CATransform3DIdentity;
    trans = CATransform3DRotate(trans, -degreesToRadians(180.0f), 1.0f, 0.0f, 0.0f);
    [l setTransform:trans];
    
    [self setReflectionLayer:l];
    
    [[self layer] addSublayer:[self reflectionLayer]];
    
    //  [[self layer] setCornerRadius:15.0f];
    //  [[self layer] setMasksToBounds:YES];
    
    
    return self;
}

- (void)dealloc
{
    [image release], image = nil;
    [reflectionLayer release], reflectionLayer = nil;
    [super dealloc];
}

- (CATransform3D)startingTransform
{
    CATransform3D start = CATransform3DIdentity;
    start.m34 = 1.0f / -500.0f;
    start = CATransform3DTranslate(start, 100.0, 0.0, -500.0f);
    start = CATransform3DRotate(start, degreesToRadians(15.0f), 0.0, 1.0f, 0.0f);
    
    return start;
}

/*
 CATransform3D
{
CGFloat m11（x缩放）, m12（y切变）, m13（旋转）, m14（）;
CGFloat m21（x切变）, m22（y缩放）, m23（）, m24（）;
CGFloat m31（旋转）, m32（）, m33（）, m34（透视效果，要操作的这个对象要有旋转的角度，否则没有效果。正直/负值都有意义）;
CGFloat m41（x平移）, m42（y平移）, m43（z平移）, m44（）;
 };
 */

- (CAAnimation*)animation
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    NSMutableArray *transforms = [NSMutableArray array];
    
    [transforms addObject:[NSValue valueWithCATransform3D:[[self layer] transform]]];
    
//    自己画个立体的图就明白了
    
    CATransform3D trans = CATransform3DIdentity;
    trans.m34 = -1.0f / 500.0f;
    trans = CATransform3DTranslate(trans, 50.0f, 0.0f, -400.0f);
    trans = CATransform3DRotate(trans, degreesToRadians(10.0f), 0.0, 1.0f, 0.0f);
    
    [transforms addObject:[NSValue valueWithCATransform3D:trans]];
    
    trans = CATransform3DIdentity;
    trans.m34 = -1.0f / 500.0f;
    trans = CATransform3DTranslate(trans, 0.0f, 0.0f, -300.0f);
    trans = CATransform3DRotate(trans, degreesToRadians(5.0f), 0.0, 1.0f, 0.0f);
    
    [transforms addObject:[NSValue valueWithCATransform3D:trans]];
    
    trans = CATransform3DIdentity;
    trans.m34 = -1.0f / 500.0f;
    trans = CATransform3DTranslate(trans, -100.0f, 0.0f, -200.0f);
    trans = CATransform3DRotate(trans, 0.0, 0.0, 1.0f, 0.0f);
    
    [transforms addObject:[NSValue valueWithCATransform3D:trans]];
    
    trans = CATransform3DIdentity;
    trans.m34 = -1.0f / 500.0f;
    trans = CATransform3DTranslate(trans, -300.0f, 0.0f, 0.0f);
    trans = CATransform3DRotate(trans, degreesToRadians(20.0f), 0.0, 1.0f, 0.0f);
    
    [transforms addObject:[NSValue valueWithCATransform3D:trans]];
    
    trans = CATransform3DIdentity;
    trans.m34 = -1.0f / 500.0f;
    trans = CATransform3DTranslate(trans, -600.0f, 0.0f, 100.0f);
    trans = CATransform3DRotate(trans, degreesToRadians(25.0f), 0.0, 1.0f, 0.0f);
    
    [transforms addObject:[NSValue valueWithCATransform3D:trans]];
    
    [anim setValues:transforms];
    [anim setDuration:7.0f];
    [anim setRepeatCount:HUGE_VALF];
    
    return anim;
}

- (void)run
{
    [[self layer] setContents:(id)[image CGImage]]; //我添加的
    
    [[self layer] setTransform:[self startingTransform]];
    [[self layer] addAnimation:[self animation] forKey:@"transform"];
}

- (void)stop
{
    [[self layer] removeAnimationForKey:@"transform"];
    [[self layer] setTransform:[self startingTransform]];
}

- (void)toggleAnimation
{
    if ([self animationIsRunning])
    {
        [self stop];
    }
    else
    {
        [self run];
    }
}

- (BOOL)animationIsRunning
{
    return [[[self layer] animationKeys] containsObject:@"transform"];
}

- (CATransform3D)currentTransform
{
    //  return [self transformForOffsetLinear:[self offset]];
    return [self transformForOffsetCustom:[self offset]];
}

- (CATransform3D)transformForOffsetLinear:(CGFloat)off
{
    CATransform3D trans = CATransform3DIdentity;
    trans.m34 = -1.0f / 500.0f;
    
    trans = CATransform3DTranslate(trans, 0.0f, 0.0f, kMinZTransform * off);
    trans = CATransform3DTranslate(trans, kMaxXTransform * off, 0.0f, 0.0f);
    trans = CATransform3DRotate(trans, degreesToRadians(kMaxYRotation * off), 0.0f, 1.0f, 0.0f);
    
    return trans;
}

- (CATransform3D)transformForOffsetCustom:(CGFloat)off
{
    CATransform3D trans = CATransform3DIdentity;
    trans.m34 = -1.0f / 700.0f;
    
    if (showZTranslation)
    {
        CGFloat zRange = kMaxZTransform - kMinZTransform;
        CGFloat zCurrent = kMinZTransform + off * zRange;
        
        trans = CATransform3DTranslate(trans, 0.0f, 0.0f, zCurrent);
    }
    
    if (showXTranslation)
    {
        CGFloat xRange = kMaxXTransform - kMinXTransform;
        CGFloat xCurrent = kMaxXTransform - off * xRange;
        
        trans = CATransform3DTranslate(trans, xCurrent, 0.0f, 0.0f);
    }
    
    if (showYRotation) 
    {
        int index = (int)(off*10.0f);
        trans = CATransform3DRotate(trans, degreesToRadians(rotations[index]), 0.0f, 1.0f, 0.0f);
    }
    
    return trans;
}

- (void)updateTransform
{
    [[self layer] setTransform:[self currentTransform]];
    
    if ([self showImage])
        [[self layer] setContents:(id)[image CGImage]];
    else
        [[self layer] setContents:nil];
    
}

- (UIColor*)randomColor;
{
    CGFloat red =  (CGFloat)arc4random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)arc4random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)arc4random()/(CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
