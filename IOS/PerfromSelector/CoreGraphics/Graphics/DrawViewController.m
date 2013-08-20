//
//  DrawViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-16.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "DrawViewController.h"

#define CurrentContext (UIGraphicsGetCurrentContext())

@interface DrawView : UIView
{
    UIImageView *_drawImage;
    BOOL mouseSwiped;
    CGPoint lastPoint;
}

@property (nonatomic, retain) UIImageView *drawImage;

@end

@implementation DrawView
@synthesize drawImage = _drawImage;

- (id) init
{
    if (self = [super init]) {
        _drawImage = [[UIImageView alloc] initWithFrame:[ViewManager viewFrameWithout_footerBar]];
        [self addSubview:_drawImage];
    }
    
    return self;
}

- (void) layoutSubviews
{
    
}

- (void) drawRect:(CGRect)rect
{
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    if ([touch tapCount] == 2) {
        _drawImage.image = nil;
        return;
    }
    
    lastPoint = [touch locationInView:self];
    lastPoint.y -= 10;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    currentPoint.y -= 10;

//    创建一个bitmap设备上下文，如果不创建，UIGraphicsGetCurrentContext不能获取当前设备上下文
    UIGraphicsBeginImageContext(self.frame.size);
    
    [_drawImage.image drawInRect:[ViewManager viewFrameWithout_footerBar]];
    CGContextSetLineCap(CurrentContext, kCGLineCapRound);
    CGContextSetLineWidth(CurrentContext, 10.0f);
    CGContextSetRGBStrokeColor(CurrentContext, 0.2, 0.6, 0.8, 1.0);
    
    CGContextBeginPath(CurrentContext);
    
    CGContextMoveToPoint(CurrentContext, lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(CurrentContext, currentPoint.x, currentPoint.y);
    CGContextStrokePath(CurrentContext);
    
    _drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    lastPoint = currentPoint;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if ([touch tapCount] == 2) {
        _drawImage.image = nil;
        return;
    }
    
    if (!mouseSwiped) {
        UIGraphicsBeginImageContext(self.frame.size);
        [_drawImage.image drawInRect:[ViewManager viewFrameWithout_footerBar]];
        CGContextSetLineCap(CurrentContext, kCGLineCapRound);
        CGContextSetLineWidth(CurrentContext, 10.0f);
        CGContextSetRGBStrokeColor(CurrentContext, 0.2, 0.6, 0.8, 1.0);
        CGContextMoveToPoint(CurrentContext, lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(CurrentContext, lastPoint.x, lastPoint.y);
        CGContextStrokePath(CurrentContext);
        
        CGContextFlush(CurrentContext);
        _drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}

@end

@implementation DrawViewController

- (void) loadView
{
    self.view = [DrawView new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
