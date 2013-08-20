//
//  RootViewController.m
//  TextDemo
//
//  Created by Zogful.Lee on 13-2-28.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RootViewController.h"

#pragma mark NSMutableAttributedString创建
NSMutableAttributedString* getAttributedString()
{
    
    NSMutableAttributedString *attriString = [[[NSMutableAttributedString alloc] initWithString:@"this is attriString!"]
                                              autorelease];
    
    [attriString addAttribute:(NSString *)kCTForegroundColorAttributeName
                        value:(id)[UIColor redColor].CGColor
                        range:NSMakeRange(0, 4)];
    //把is变为黄色
    [attriString addAttribute:(NSString *)kCTForegroundColorAttributeName
                        value:(id)[UIColor greenColor].CGColor
                        range:NSMakeRange(5, 2)];
    
    //    attriString 棕色
    [attriString addAttribute:(NSString *)kCTForegroundColorAttributeName
                        value:(id)[UIColor brownColor].CGColor
                        range:NSMakeRange(7, 12)];
    
    //改变this的字体，value必须是一个CTFontRef
    [attriString addAttribute:(NSString *)kCTFontAttributeName
                        value:(id)CTFontCreateWithName((CFStringRef)[UIFont boldSystemFontOfSize:14].fontName, 18, NULL)
                        range:NSMakeRange(0, 4)];
    
    //给this加上下划线，value可以在指定的枚举中选择
    [attriString addAttribute:(NSString *)kCTUnderlineStyleAttributeName
                        value:(id)[NSNumber numberWithInt:kCTUnderlineStyleDouble]
                        range:NSMakeRange(0, 4)];
    return attriString;
}

@interface RootView : UIView
@end

@implementation RootView

- (void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    NSAttributedString *attriString = getAttributedString();
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextConcatCTM(ctx, CGAffineTransformScale(CGAffineTransformMakeTranslation(0, rect.size.height), 1.0f, -1.0f));
//    等价上一行    
//    CGContextTranslateCTM(ctx, 0, rect.size.height);
//    CGContextScaleCTM(ctx, 1, -1);
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attriString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, rect);
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    CFRelease(framesetter);
    
    CTFrameDraw(frame, ctx);
    CFRelease(frame);
}

@end

@implementation RootViewController

- (void) loadView
{
    self.view = [[RootView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width, [[UIScreen mainScreen] applicationFrame].size.height)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
//    第二种办法展示字体  RootView 改为 UIView
//    CATextLayer *textLayer = [CATextLayer layer];
//    textLayer.string = getAttributedString();
//    textLayer.frame = CGRectMake(0, 0, 200, 200);
//    [self.view.layer addSublayer:textLayer];
}

@end
