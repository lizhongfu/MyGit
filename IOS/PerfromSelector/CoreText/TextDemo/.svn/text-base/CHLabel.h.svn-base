//
//  CHLabel.h
//  TextDemo
//
//  Created by Zogful.Lee on 13-3-4.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<CoreText/CoreText.h>

typedef enum
{
    kCHLabelUnderlineStyleNone = 0 ,
    kCHLabelUnderlineStyleSingle ,
    kCHLabelUnderlineStyleThick ,
    kCHLabelUnderlineStyleDouble 
} CHLabelUnderlineStyle;

@protocol CHLabelDelegate;
@interface CHLabel : UILabel
{
    NSString                  *_textCH;              //文本
    UIColor                   *_textColorCH;         //文本颜色
    UIFont                    *_textFontCH;          //文本字体
    CHLabelUnderlineStyle      _textUnderlineStyle;  //文本下划线
    
    NSString                  *_textKeyWordCH;       //关键字
    UIColor                   *_textKeyWordColorCH;  //关键字颜色
    UIFont                    *_keyWordFontCH;       //关键字字体
    CHLabelUnderlineStyle      _keyWordUnderlineStyle;//关键字下划线
    
    NSMutableArray            *_keyWordsCH;          //关键字数组
    NSMutableAttributedString *_attributedString;    //属性字符串
}

@property (nonatomic,   copy) NSString                  *textCH;
@property (nonatomic, retain) UIColor                   *textColorCH;
@property (nonatomic,   copy) NSString                  *textKeyWordCH;
@property (nonatomic, retain) UIColor                   *textKeyWordColorCH;
@property (nonatomic, retain) UIFont                    *textFontCH;
@property (nonatomic, retain) UIFont                    *keyWordFontCH; 
@property (nonatomic, retain) NSMutableArray            *keyWordsCH;
@property (nonatomic, retain) NSMutableAttributedString *attributedString;
@property (nonatomic, retain) id<CHLabelDelegate>        delegate;

- (void) setText:(NSString *) textString andKeyWord:(NSString *) keyWord;

- (void) setTextColor:(UIColor *)textColor andKeyWordColor:(UIColor *) keyWordColor;

- (void) setTextFont: (UIFont *)textFont andKeyWordFont:(UIFont *) keyWordFont;

- (void) setTextUnderlineStyle: (CHLabelUnderlineStyle)textUnderlineStyle andKeyWordUnderlineStyle:(CHLabelUnderlineStyle) keyWordUnderlineStyle;

@end

@protocol CHLabelDelegate <NSObject>
@optional
- (void) CHLabel:(CHLabel *) chLabel tapOnKeyWord:(NSString *) keyWord;

@end