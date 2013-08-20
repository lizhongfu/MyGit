//
//  Animation1ViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-14.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "Animation1ViewController.h"

@interface Animation1ViewController ()
{
    UIImageView *iconImageView1;
    UIImageView *iconImageView2;
}

@end

@implementation Animation1ViewController

#pragma mark -
#pragma mark 动画结束回调
- (void) icon1AnimationDidStop:(NSString *) animationId
                       finish:(NSNumber *)paramFinished
                      context:(void *) paramContext
{
    //    paramFinished 一个“已完成”的标识，NSNumber包装的BOOL值，如果动画顺利的完成则为YES，如果动画完成之前被中断，则为NO
    
    NSLog(@"Animation finished.");
    NSLog(@"Animation ID = %@", animationId);
    UIImageView *im = (UIImageView *)paramContext;
    NSLog(@"Image view = %@", im);
    
    [im removeFromSuperview];
}

- (void) icon2AnimationDidStop:(NSString *) animationId
                        finish:(NSNumber *)paramFinished
                       context:(void *) paramContext
{
    //    paramFinished 一个“已完成”的标识，NSNumber包装的BOOL值，如果动画顺利的完成则为YES，如果动画完成之前被中断，则为NO
    
    NSLog(@"Animation finished.");
    NSLog(@"Animation ID = %@", animationId);
    UIImageView *im = (UIImageView *)paramContext;
    NSLog(@"Image view = %@", im);
    
    [im removeFromSuperview];
}


#pragma mark -
#pragma mark iconImageView1动画
- (void) startTopLeftImageViewAnimation
{
    iconImageView1.frame = CGRectMake(0, 0, 100, 100);
    [iconImageView1 setAlpha:1.0];
    
    [UIView beginAnimations:@"iconImageViewAnimation1" context:iconImageView1];
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(icon1AnimationDidStop:finish:context:)];
    
    iconImageView1.frame = CGRectMake(220, 350, 100, 100);
    iconImageView1.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    [UIView commitAnimations];
}

#pragma mark -
#pragma mark iconImageView1动画

- (void) startBottomRightViewAnimationAfterDelay:(CGFloat) paramDelay
{
    iconImageView2.frame = CGRectMake(220, 350, 100, 100);
    [iconImageView2 setAlpha:1.0];
    
    [UIView beginAnimations:@"iconImageViewAnimation2" context:iconImageView2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationDelay:paramDelay];
    [UIView setAnimationDidStopSelector:@selector(icon2AnimationDidStop:finish:context:)];
    
    iconImageView2.frame = CGRectMake(0, 0, 100, 100);
    iconImageView2.transform = CGAffineTransformMakeRotation((45 * M_PI) / 180);
    
    [UIView commitAnimations];
}

#pragma mark -
- (void) viewDidAppear:(BOOL)animated
{
    [self startTopLeftImageViewAnimation];
    [self startBottomRightViewAnimationAfterDelay:4];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    iconImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon.png"]];
    iconImageView1.frame = CGRectMake(0, 0, 100, 100);
    iconImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon.png"]];
    iconImageView2.frame = CGRectMake(220, 350, 100, 100);
    
    [self.view addSubview:iconImageView1];
    [self.view addSubview:iconImageView2];
}

- (void) dealloc
{
    [iconImageView1 release];
    [iconImageView2 release];
    
    [super dealloc];
}

@end
