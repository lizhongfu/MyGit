//
//  AnimationViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-14.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationView : UIView

@end

@implementation AnimationView

- (void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

@end

@implementation AnimationViewController
@synthesize iconImageView;

#pragma mark -
#pragma mark 动画结束回调
- (void) iconAnimationDidStop:(NSString *) animationId
                       finish:(NSNumber *)paramFinished
                      context:(void *) paramContext
{
//    paramFinished 一个“已完成”的标识，NSNumber包装的BOOL值，如果动画顺利的完成则为YES，如果动画完成之前被中断，则为NO
    
    NSLog(@"Animation finished.");
    NSLog(@"Animation ID = %@", animationId);
    UIImageView *im = (UIImageView *)paramContext;
    NSLog(@"Image view = %@", im);
}

#pragma mark -

- (id) init
{
    if (self = [super init]) {
        iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon.png"]];
        [iconImageView setFrame:CGRectMake(0, 0, 100, 100)];
    }
    
    return self;
}

- (void) loadView
{
    self.view = [AnimationView new];
}

- (void) viewDidAppear:(BOOL)animated
{
    self.iconImageView.frame = CGRectMake(0, 0, 100, 100);
    
//    开始动画块。对视图的任何动画属性的改变，都会在动画块提交之后形成动画
    [UIView beginAnimations:@"iconImageViewAnimation" context:self.iconImageView];
    
    [UIView setAnimationDelay:1.0f];//延迟1秒之后执行动画
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationRepeatCount:3];//动画重复执行的次数
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(iconAnimationDidStop:finish:context:)];
    
    self.iconImageView.frame = CGRectMake(200, 350, 100, 100);
    
    [UIView commitAnimations];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame = [ViewManager mainWindowFrame];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:iconImageView];
}

- (void) dealloc
{
    [iconImageView release];
    
    [super dealloc];
}


@end
