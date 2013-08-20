//
//  ExplodedViewViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ExplodedViewViewController.h"
#include <stdlib.h>
#include <time.h>
#import <QuartzCore/QuartzCore.h>

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

#define ISRETINADISPLAY (([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) ? [[UIScreen mainScreen] scale] > 1.0 : NO)

#define degreesToRadians(x) (M_PI * x / 180.0)

@interface UIView(ExplodedExtentions)
- (void)toggleExplodedView;
- (void)enableBorders;
@end

@implementation UIView(ExplodedExtentions)
- (void)toggleExplodedView;
{
    CATransform3D transform = CATransform3DIdentity;
    
    if (CATransform3DIsIdentity([[self layer] sublayerTransform]))
    {
        transform.m34 = -1.0f / 850.0f;
        transform = CATransform3DRotate(transform, degreesToRadians(55), 0.0f, 1.0f, 0.0f);
        transform = CATransform3DRotate(transform, -degreesToRadians(15), 1.0f, 0.0f, 0.0f);
        transform = CATransform3DTranslate(transform, 0.0f, 0.0f, 100.0f);
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"sublayerTransform"];
        [animation setFromValue:[NSValue valueWithCATransform3D:[[self layer] transform]]];
        [animation setToValue:[NSValue valueWithCATransform3D:transform]];
        [animation setDuration:0.60f];
        
        [[self layer] addAnimation:animation forKey:@"sublayerTransform"];
        
        [[self layer] setSublayerTransform:transform];
        
        CGFloat distance = 75;
        CGFloat totalDistance = distance * [[[self layer] sublayers] count];
        CGFloat halfDistance = totalDistance / 2.0;
        CGFloat zpos = -halfDistance;
        for (CALayer *layer in [[self layer] sublayers])
        {
            [layer setZPosition:zpos];
            zpos += distance;      
        }
    }
    else 
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"sublayerTransform"];
        [animation setFromValue:[NSValue valueWithCATransform3D:[[self layer] transform]]];
        [animation setToValue:[NSValue valueWithCATransform3D:transform]];
        
        [[self layer] setSublayerTransform:transform];
        [[self layer] addAnimation:animation forKey:@"sublayerTransform"];
    }
    
}

- (void)enableBorders
{
    for (CALayer *layer in [[self layer] sublayers])
    {
        [layer setBorderWidth:2.0f];
    }  
}
@end

@implementation ExplodedViewViewController

+ (NSString *)friendlyName {
    return @"UIView中空间3D旋转";
}

- (void) go {
    UIView *aView = [self.view viewWithTag:100];
    
    [aView enableBorders];
    [aView toggleExplodedView];
}

- (void) buildOtherView {
    
    for (UIView *aView in [self.view subviews]) {
        [aView removeFromSuperview];
    }
    
    UIView *aView = [[UIView alloc] initWithFrame:BaseFrame];
    aView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    aView.tag = 100;
    
    CGRect btRect = CGRectMake(0, 0, 80, 80);
    srand((unsigned)time(NULL));
    
    UIButton *bta = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bta.frame = btRect;
    bta.center = CGPointMake(rand()%200, rand()%340);
    
    UIButton *btb = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btb.frame = btRect;
    btb.center = CGPointMake(rand()%200, rand()%330);
    
    UIButton *btc = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btc.frame = btRect;
    btc.center = CGPointMake(rand()%200, rand()%340);
    
    [aView addSubview:bta];
    [aView addSubview:btb];
    [aView addSubview:btc];
    
    [self.view addSubview:aView];
    [aView release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    [self buildOtherView];
    
	self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonItemStyleDone
                                                  target:self
                                                  action:@selector(go)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
