//
//  CHLabel.m
//  TextDemo
//
//  Created by Zogful.Lee on 13-3-4.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "CHLabel.h"

@implementation CHLabel

@synthesize textCH               = _textCH;
@synthesize textColorCH          = _textColorCH;
@synthesize textKeyWordCH        = _textKeyWordCH;
@synthesize textKeyWordColorCH   = _textKeyWordColorCH;
@synthesize textFontCH           = _textFontCH;
@synthesize keyWordFontCH        = _keyWordFontCH;
@synthesize keyWordsCH           = _keyWordsCH;
@synthesize attributedString     = _attributedString;
@synthesize delegate;

void safeRelease(id pointer)
{
    if (!pointer)
    {
        [pointer release];
        pointer = nil;
    }
}

- (void) dealloc
{
    safeRelease(_textCH);
    safeRelease(_textColorCH);
    safeRelease(_textKeyWordCH);
    safeRelease(_textKeyWordColorCH);
    safeRelease(_textFontCH);
    safeRelease(_keyWordFontCH);
    safeRelease(_keyWordsCH);
    safeRelease(_attributedString);
    safeRelease(delegate);
    
    [super dealloc];
}

- (void) initializtion
{
    _textKeyWordCH = nil;
    _textKeyWordColorCH = nil;
    _keyWordsCH = [[NSMutableArray alloc] init];
}

- (id) init
{
    if (self = [super init])
    {
        [self initializtion];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame])
    {
        [self initializtion];
    }
    return self;
}

- (void) setText:(NSString *) textString andKeyWord:(NSString *) keyWord
{
    if (self.text != textString)
    {
        self.text = textString;
        self.textCH = textString;
    }
    
    [self fetchKeywordRange:keyWord];
}

- (void) setTextColor:(UIColor *)textColor andKeyWordColor:(UIColor *) keyWordColor
{
    self.textColorCH = textColor;
    self.textKeyWordColorCH = keyWordColor;
}

- (void) setTextFont:(UIFont *)textFont andKeyWordFont:(UIFont *) keyWordFont
{
    self.textFontCH = textFont;
    self.keyWordFontCH = keyWordFont;
}

- (void) setTextUnderlineStyle: (CHLabelUnderlineStyle)textUnderlineStyle andKeyWordUnderlineStyle:(CHLabelUnderlineStyle) keyWordUnderlineStyle
{
    _textUnderlineStyle = textUnderlineStyle;
    _keyWordUnderlineStyle = keyWordUnderlineStyle;
}

- (void) fetchKeywordRange:(NSString *)keyWord
{
    if (nil == keyWord) {
        return;
    }
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSUInteger count = 0, length = [mutableAttributedString length];
    NSRange range = NSMakeRange(0, length);
    
    count = 0, length = [mutableAttributedString length];
    range = NSMakeRange(0, length);
    
    while(range.location != NSNotFound)
    {
        range = [[mutableAttributedString string] rangeOfString:keyWord options:0 range:range];
        if(range.location != NSNotFound) {
       
            NSValue *value = [NSValue valueWithRange:range];
            if (range.length > 0) {
                [self.keyWordsCH addObject:value];
            }
            
            range = NSMakeRange(range.location + range.length, length - (range.location + range.length));
            count++;
        }
    }
}

- (int) labelUnderlineType:(CHLabelUnderlineStyle) lType
{
    int underLineType;
    switch (lType) {
        case 0:
            underLineType = kCTUnderlineStyleNone;
            break;
        case 1:
            underLineType = kCTUnderlineStyleSingle;
            break;
        case 2:
            underLineType = kCTUnderlineStyleThick;
            break;
        case 3:
            underLineType = kCTUnderlineStyleDouble;
            break;
        default:
            underLineType = kCTUnderlineStyleNone;
            break;
    }
    
    return underLineType;
}

- (NSAttributedString *) richString:(NSString *) textString
{
    int length = [textString length];
    if (self.attributedString) {
        self.attributedString = nil;
    }
   self.attributedString = [[NSMutableAttributedString alloc] initWithString:textString];
    [self.attributedString addAttribute:(NSString *)(kCTForegroundColorAttributeName)
                             value:(id)self.textColorCH.CGColor
                             range:NSMakeRange(0, length)];
    
    int numType = 0;
    CFNumberRef cfNum = CFNumberCreate(NULL, kCFNumberIntType, &numType);
    [self.attributedString addAttribute:(NSString *)kCTLigatureAttributeName
                                  value:(id)cfNum
                                  range:NSMakeRange(0, length)];
    
    float fNum =3.0;
    CFNumberRef cfNum2 = CFNumberCreate(NULL, kCFNumberFloatType, &fNum);
    [self.attributedString addAttribute:(NSString *)(kCTStrokeColorAttributeName)
                                  value:(id)cfNum2
                                  range:NSMakeRange(0, length)];
    
    if (!self.textFontCH) {
        self.textFontCH = self.font;
    }
    CTFontRef ctFont = CTFontCreateWithName((CFStringRef)self.textFontCH.fontName, self.textFontCH.pointSize, NULL);
    [self.attributedString addAttribute:(NSString *)(kCTFontAttributeName)
                                  value:(id)ctFont
                                  range:NSMakeRange(0, length)];
    
    int underLineType = [self labelUnderlineType:_textUnderlineStyle];
    CFNumberRef cfUnderLine = CFNumberCreate(NULL, kCTUnderlineStyleThick, &underLineType);
    [self.attributedString addAttribute:(NSString *)(kCTUnderlineStyleAttributeName)
                                  value:(id)cfUnderLine
                                  range:NSMakeRange(0, length)];
    
    if (self.textKeyWordColorCH != nil)
    {
        for (NSValue *value in self.keyWordsCH)
        {
            NSRange keyRange = [value rangeValue];
            [self.attributedString addAttribute:(NSString *)(kCTForegroundColorAttributeName)
                                          value:(id)self.textKeyWordColorCH.CGColor
                                          range:keyRange];
            
            if (!self.keyWordFontCH) {
                self.keyWordFontCH = self.font;
            }
            CTFontRef ctFont = CTFontCreateWithName((CFStringRef)self.keyWordFontCH.fontName, self.keyWordFontCH.pointSize, NULL);
            [self.attributedString addAttribute:(NSString *)(kCTFontAttributeName)
                                          value:(id)ctFont
                                          range:keyRange];
            
            int underLineType = [self labelUnderlineType:_keyWordUnderlineStyle];
            CFNumberRef cfUnderLine = CFNumberCreate(NULL, kCTUnderlineStyleThick, &underLineType);
            [self.attributedString addAttribute:(NSString *)(kCTUnderlineStyleAttributeName)
                                          value:(id)cfUnderLine
                                          range:keyRange];
            
            [self.attributedString addAttribute:@"option" value:[[self.attributedString string] substringWithRange:keyRange] range:keyRange];//弹出alert时候需要
        }
    }
    
    return [[self.attributedString copy] autorelease];
}

- (void) drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextConcatCTM(context, CGAffineTransformScale(CGAffineTransformMakeTranslation(0, rect.size.height+6.5), 1.f, -1.f));
    
    CGContextSetTextPosition(context, 0.0, 0.0);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef) [self richString:self.text]);
    
//    NSLog(@"AttributedString:%@", [self richString:self.text font:self.font]);
    
    CGMutablePathRef leftColumnPath = CGPathCreateMutable();
    CGPathAddRect(leftColumnPath, NULL, rect);
    CTFrameRef leftFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), leftColumnPath, NULL);
    CTFrameDraw(leftFrame, context);
    CGContextRestoreGState(context);
    CGPathRelease(leftColumnPath);
    CFRelease(framesetter);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    CGPoint tapLocation = [[touches anyObject] locationInView:self];
    int total_height = [self getAttributedStringHeightWithString:self.attributedString WidthValue:self.frame.size.width];//width为自身宽度
    //判断点击是否超出范围
    if (tapLocation.y >= total_height) {
        return;
    }
    
    /** 1. Setup CTFramesetter **/
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self.attributedString);
    /** 2. Create CTFrame **/
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, self.frame.size.width, 1000));//height越大越好，
    
    CTFrameRef textFrameForKey = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    //[self drawFrame:textFrameForKey inContext:nil forString:nil];
    CFRelease (path);
    CFRelease (framesetter);
    //CTFrameGetLineOrigins
    NSArray *linesArray = (NSArray *) CTFrameGetLines(textFrameForKey);
    
    CGPoint origins[[linesArray count]];
    CTFrameGetLineOrigins(textFrameForKey, CFRangeMake(0, 0), origins);
    CFArrayRef lines = CTFrameGetLines(textFrameForKey);
    
    CGFloat ascent;
    CGFloat descent;
    CGFloat leading;
    
    CTLineRef line = (CTLineRef) [linesArray objectAtIndex:0];
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    
    //CFIndex linesCount = CFArrayGetCount(lines);
    
    int line_y = 1000- (int)origins[0].y;  //第一行line的原点y坐标
    int line_height = line_y + (int)descent +1; //每行的高度
    
    int current_line = tapLocation.y/line_height;
    
    CFIndex curentIndex = CTLineGetStringIndexForPosition((CTLineRef)CFArrayGetValueAtIndex(lines, current_line),tapLocation);
    
    //判断超出范围
    if (curentIndex >[self.attributedString length]) {
        return;
    }
    
    NSRange currentRange = NSMakeRange(0, [self.attributedString length]);
    //curentIndex
    NSDictionary *dic = [self.attributedString attributesAtIndex:curentIndex-1 effectiveRange:&currentRange];
    id option = [dic valueForKey:@"option"];
    
    if (option) {
     
        if ([delegate respondsToSelector:@selector(CHLabel:tapOnKeyWord:)])
        {
            [delegate CHLabel:self tapOnKeyWord:(NSString *)[dic valueForKey:@"option"]];
        }
    }
}

//获取coretext高度
- (int)getAttributedStringHeightWithString:(NSAttributedString *)string  WidthValue:(int) width
{
    int total_height = 0;
    
    //string 为要计算高度的NSAttributedString
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)string);
    
    CGRect drawingRect = CGRectMake(0, 0, width, 1000);  //这里的高要设置足够大
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, drawingRect);
    CTFrameRef textFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,0), path, NULL);
    CGPathRelease(path);
    CFRelease(framesetter);
    
    NSArray *linesArray = (NSArray *) CTFrameGetLines(textFrame);
    
    CGPoint origins[[linesArray count]];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    
    int line_y = (int) origins[[linesArray count] -1].y;  //最后一行line的原点y坐标
    
    CGFloat ascent;
    CGFloat descent;
    CGFloat leading;
    
    CTLineRef line = (CTLineRef) [linesArray objectAtIndex:[linesArray count]-1];
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    
    total_height = 1000 - line_y + (int) descent +1;    //+1为了纠正descent转换成int小数点后舍去的值
    
    CFRelease(textFrame);
    
    return total_height;
}

@end
