//
//  RegexHelper.m
//  RegexDemo
//
//  Created by Zogful.Lee on 13-3-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RegexHelper.h"


#define Log(msg) NSLog(@"log message: %@ line:%d", msg, __LINE__)

@implementation RegexHelper


+ (void) logResultWithPatternStr:(NSString *) patternStr inputString:(NSString *) inputString
{
    if (!patternStr || !inputString)
    {
        Log(@"patternStr 或 inputString 不能为 nil");
        return;
    }
    
    if (_IF_LOG_RESULT_)
    {
        NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:patternStr
                                                                             options:NSRegularExpressionDotMatchesLineSeparators
                                                                               error:nil];
        
        NSArray *textArr = [exp matchesInString:inputString options:0 range:NSMakeRange(0, [inputString length])];
        
        NSLog(@"输入字符串 :%@", inputString);
        NSLog(@"有效的子字符串:");
        for (NSTextCheckingResult *result in textArr)
        {
            NSLog(@"%@", [inputString substringWithRange:result.range]);
        }
    }
}

+ (BOOL) validateDigitalWithInputString:(NSString *) inputString
{
    
    NSString *patternStr = [NSString stringWithFormat:@"[0-9]"];
    if (!inputString)
    {
        Log(@"待验证数字字符串不能为 nil");
        return NO;
    }
    
    NSError *error = nil;
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:patternStr
                                              options:NSRegularExpressionCaseInsensitive
                                              error:&error];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:inputString
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, inputString.length)];
    [regularexpression release];
    
    if (error)
    {
        Log(error);
        return NO;
    }
    
    NSString *msg = nil;
    if(numberofMatch > 0)
    {
        msg = [NSString stringWithFormat:@"%@ 输入字符串中存在数字[0-9]", inputString];
        Log(msg);
        return YES;
    }
    
    msg = [NSString stringWithFormat:@"%@ 输入字符串中无数字[0-9]", inputString];
    Log(msg);
    
    return NO;
}

+ (BOOL) validateChineseWithInputString:(NSString *) inputString
{
     NSString *patternStr = [NSString stringWithFormat:@"[\u4e00-\u9fa5]"];
    if (!inputString)
    {
        Log(@"待验证中文字符串不能为 nil");
        return NO;
    }
    
    NSError *error = nil;
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:patternStr
                                              options:NSRegularExpressionCaseInsensitive
                                              error:&error];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:inputString
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, inputString.length)];
    [regularexpression release];
    
    if (error)
    {
        Log(error);
        return NO;
    }
    
    NSString *msg = nil;
    if(numberofMatch > 0)
    {
        msg = [NSString stringWithFormat:@"%@ 输入字符串中存在中文", inputString];
        Log(msg);
        return YES;
    }
    msg = [NSString stringWithFormat:@"%@ 输入字符串无中文", inputString];
    Log(msg);
    
    return NO;
}

+ (BOOL) validateStartAlphabetWithInputString:(NSString *) inputString
{
    NSString *patternStr = [NSString stringWithFormat:@"^[A-Za-z_]+.*$"];
    if (!inputString)
    {
        Log(@"patternStr 或 inputString 不能为 nil");
        return NO;
    }
    
    NSError *error = nil;
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:patternStr
                                              options:NSRegularExpressionCaseInsensitive
                                              error:&error];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:inputString
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, inputString.length)];
    [regularexpression release];
    
    if (error)
    {
        Log(error);
        return NO;
    }
    
    NSString *msg = nil;
    if(numberofMatch > 0)
    {
        msg = [NSString stringWithFormat:@"%@ 输入字符以字母或下划线开始", inputString];
        Log(msg);
        return YES;
    }
    msg = [NSString stringWithFormat:@"%@ 输入字符不以字母或下划线开始", inputString];
    Log(msg);
    
    return NO;
}

+ (BOOL) validateLengthOfString:(NSString *) inputStr maxLength:(uint) maxLength minLength:(uint) minLengt
{
    NSString *regularStr = [NSString stringWithFormat:@"^\\w{%d,%d}$", minLengt, maxLength];
    NSRegularExpression *regularexpression = [NSRegularExpression regularExpressionWithPattern:regularStr
                                                                         options:NSRegularExpressionDotMatchesLineSeparators
                                                                           error:nil];
    NSArray *textArr = [regularexpression matchesInString:inputStr options:0 range:NSMakeRange(0, [inputStr length])];
    
    if ([textArr count] > 0) {
        return YES;
    }
    return NO;
}

+ (BOOL) validateString:(NSString *) inputStr digital:(BOOL) allowDigital chinese:(BOOL) allowChinese startAlph:(BOOL) startWithAlphabet maxLength:(uint) maxLength minLength:(uint) minLength
{
    if (!inputStr)
    {
        Log(@"待验证中文字符串不能为 nil");
        return NO;
    }
    
    if (maxLength < minLength)
    {
        Log(@"maxLength or minLength is error");
        return NO;
    }
    
    BOOL digitalResult = YES, chineseResult = YES, ifStartWithAlphabet = YES, lengthIsTrue = YES;
    
    if (!allowDigital)
    {
        if ([self validateDigitalWithInputString:inputStr])
            digitalResult = NO;
        else
            digitalResult = YES;
    }
    
    if (!allowChinese)
    {
        if ([self validateChineseWithInputString:inputStr])
            chineseResult = NO;
        else
            chineseResult = YES;
    }
    
    if (!startWithAlphabet)
    {
        if ([self validateStartAlphabetWithInputString:inputStr])
            ifStartWithAlphabet = NO;
        else
            ifStartWithAlphabet = YES;
    }
    
    if ([self validateLengthOfString:inputStr maxLength:maxLength minLength:minLength])
    {
        lengthIsTrue = YES;
    } else
    {
        lengthIsTrue = NO;
    }
    
    return digitalResult && chineseResult && ifStartWithAlphabet && lengthIsTrue;
}

//校验用户邮箱
+ (BOOL) validateEmail:(NSString *) str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*.\\w+([-.]\\w+)*$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    
    [regularexpression release];
    
    if(numberofMatch > 0)
    {
        NSLog(@"%@ 邮箱格式正确", str);
        return YES;
    }
    
    NSLog(@"%@ 邮箱格式错误", str);
    return NO;
}

//移动电话号码
+ (BOOL) validateMobilePhoneNum:(NSString *) str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^[1][358]\\d{9}$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    
    [regularexpression release];
    
    if(numberofMatch > 0)
    {
        NSLog(@"%@ 电话/手机号码正确", str);
        return YES;
    }
    
    NSLog(@"%@ 电话/手机号码错误", str);
    return NO;
}

//校验用户手机号码
+ (BOOL) validatePhoneNum:(NSString *) str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^((\\d{3,4})|\\d{3,4}-)?\\d{7,8}$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    
    [regularexpression release];
    
    if(numberofMatch > 0)
    {
        NSLog(@"%@ 电话/手机号码正确", str);
        return YES;
    }
    
    NSLog(@"%@ 电话/手机号码错误", str);
    return NO;
}

+ (BOOL) validateQQNum:(NSString *) str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"[1-9][0-9]{4,}"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    
    [regularexpression release];
    
    if(numberofMatch > 0)
    {
        NSLog(@"%@ QQ号码正确", str);
        return YES;
    }
    
    NSLog(@"%@ QQ号码错误", str);
    return NO;
}

+ (BOOL) validatePostcode:(NSString *) str
{    
    NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:@"^[1-9]\\d{5}$"
                                                                         options:NSRegularExpressionDotMatchesLineSeparators
                                                                           error:nil];
    
    NSArray *textArr = [exp matchesInString:str options:0 range:NSMakeRange(0, [str length])];
    
    if([textArr count] > 0)
    {
        NSLog(@"%@ 邮编正确", str);
        return YES;
    } else
    {
        NSLog(@"%@ 邮编错误", str);
        return NO;
    }
    
    return NO;
}

+ (BOOL) validateIdentityCards:(NSString *) str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^\\d{17}[0-9X]$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingWithTransparentBounds
                                                                    range:NSMakeRange(0, str.length)];
    
    [regularexpression release];
    
    if(numberofMatch > 0)
    {
        NSLog(@"%@ 身份证号码正确", str);
        return YES;
    }
    
    NSLog(@"%@ 身份证号码错误", str);
    return NO;
}

int Chk18PaperId (const char *sPaperId)
{
    long lSumQT =0;
    //加权因子
    int R[] ={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
    //校验码
    char sChecker[11]={'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'};
    //检验长度
    if( 18 != strlen(sPaperId)) return -1;
    //校验数字
    for (int i=0; i<18; i++)
    {
        if ( !isdigit(sPaperId[i]) && !(('X' == sPaperId[i] || 'x' == sPaperId[i]) && 17 == i) )
        {
            return -1;
        }
    }
    //验证最末的校验码
    for (int i=0; i<=16; i++)
    {
        lSumQT += (sPaperId[i]-48) * R[i];
    }
    if (sChecker[lSumQT%11] != sPaperId[17] )
    {
        return -1;
    }
    
    return 0;
}


+ (BOOL) validateIP:(NSString *) str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingWithTransparentBounds
                                                                    range:NSMakeRange(0, str.length)];
    
    [regularexpression release];
    
    if(numberofMatch > 0)
    {
        NSLog(@"%@ IP正确", str);
        return YES;
    }
    
    NSLog(@"%@ IP错误", str);
    return NO;
}

+ (BOOL) validateWebsite:(NSString *) str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"[a-zA-z]+://[^\\s]*"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingWithTransparentBounds
                                                                    range:NSMakeRange(0, str.length)];
    
    [regularexpression release];
    
    if(numberofMatch > 0)
    {
        NSLog(@"%@ 网址正确", str);
        return YES;
    }
    
    NSLog(@"%@ 网址错误", str);
    return NO;
}

+ (BOOL) validateDate:(NSString *) str
{
    NSString *patternStr =
    @"((^((1[8-9]\\d{2})|([2-9]\\d{3}))([-\\/\\._])(10|12|0?[13578])([-\\/\\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\\d{2})|([2-9]\\d{3}))([-\\/\\._])(11|0?[469])([-\\/\\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\\d{2})|([2-9]\\d{3}))([-\\/\\._])(0?2)([-\\/\\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([3579][26]00)([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([1][89][0][48])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([2-9][0-9][0][48])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([1][89][2468][048])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([2-9][0-9][2468][048])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([1][89][13579][26])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([2-9][0-9][13579][26])([-\\/\\._])(0?2)([-\\/\\._])(29)$))";

    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:patternStr
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    
    [regularexpression release];
    
    if(numberofMatch > 0)
    {
        NSLog(@"%@ 日期正确", str);
        return YES;
    }
    
    NSLog(@"%@ 日期错误", str);
    return NO;
}

@end




/*
身份验证 
 */
/**
 * 功能:获取指定范围的字符串
 * 参数:字符串的开始小标
 * 参数:字符串的结束下标
 */
+(NSString *)getStringWithRange:(NSString *)str Value1:(NSInteger *)value1 Value2:(NSInteger )value2;
{
    return [str substringWithRange:NSMakeRange(value1,value2)];
}
/**
 * 功能:判断是否在地区码内
 * 参数:地区码
 */
+(BOOL)areaCode:(NSString *)code
{
    NSMutableDictionary *dic = [[[NSMutableDictionary alloc] init] autorelease];
    [dic setObject:@"北京" forKey:@"11"];
    [dic setObject:@"天津" forKey:@"12"];
    [dic setObject:@"河北" forKey:@"13"];
    [dic setObject:@"山西" forKey:@"14"];
    [dic setObject:@"内蒙古" forKey:@"15"];
    [dic setObject:@"辽宁" forKey:@"21"];
    [dic setObject:@"吉林" forKey:@"22"];
    [dic setObject:@"黑龙江" forKey:@"23"];
    [dic setObject:@"上海" forKey:@"31"];
    [dic setObject:@"江苏" forKey:@"32"];
    [dic setObject:@"浙江" forKey:@"33"];
    [dic setObject:@"安徽" forKey:@"34"];
    [dic setObject:@"福建" forKey:@"35"];
    [dic setObject:@"江西" forKey:@"36"];
    [dic setObject:@"山东" forKey:@"37"];
    [dic setObject:@"河南" forKey:@"41"];
    [dic setObject:@"湖北" forKey:@"42"];
    [dic setObject:@"湖南" forKey:@"43"];
    [dic setObject:@"广东" forKey:@"44"];
    [dic setObject:@"广西" forKey:@"45"];
    [dic setObject:@"海南" forKey:@"46"];
    [dic setObject:@"重庆" forKey:@"50"];
    [dic setObject:@"四川" forKey:@"51"];
    [dic setObject:@"贵州" forKey:@"52"];
    [dic setObject:@"云南" forKey:@"53"];
    [dic setObject:@"西藏" forKey:@"54"];
    [dic setObject:@"陕西" forKey:@"61"];
    [dic setObject:@"甘肃" forKey:@"62"];
    [dic setObject:@"青海" forKey:@"63"];
    [dic setObject:@"宁夏" forKey:@"64"];
    [dic setObject:@"新疆" forKey:@"65"];
    [dic setObject:@"台湾" forKey:@"71"];
    [dic setObject:@"香港" forKey:@"81"];
    [dic setObject:@"澳门" forKey:@"82"];
    [dic setObject:@"国外" forKey:@"91"];
    
    if ([dic objectForKey:code] == nil) {
        
        return NO;
    }
    return YES;
}

/**
 * 功能:验证身份证是否合法
 * 参数:输入的身份证号
 */
bool Chk18PaperId (NSString *sPaperId)
{
    
    //判断位数
    if ([sPaperId length] < 15 ||[sPaperId length] > 18) {
        
        return NO;
    }
    
    NSString *carid = sPaperId;
    long lSumQT =0;
    //加权因子
    int R[] ={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
    //校验码
    unsigned char sChecker[11]={'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'};
    
    //将15位身份证号转换成18位
    
    NSMutableString *mString = [NSMutableString stringWithString:sPaperId];
    if ([sPaperId length] == 15) {
        
        
        [mString insertString:@"19" atIndex:6];
        
        long p = 0;
        const char *pid = [mString UTF8String];
        for (int i=0; i<=16; i++)
        {
            p += (pid[i]-48) * R[i];
        }
        
        int o = p%11;
        NSString *string_content = [NSString stringWithFormat:@"%c",sChecker[o]];
        [mString insertString:string_content atIndex:[mString length]];
        carid = mString;
        
    }
    
    //判断地区码
    NSString * sProvince = [carid substringToIndex:2];
    
    if (![StaticTools areaCode:sProvince]) {
        
        return NO;
    }
    
    //判断年月日是否有效
    
    //年份
    int strYear = [[StaticTools getStringWithRange:carid Value1:6 Value2:4] intValue];
    //月份
    int strMonth = [[StaticTools getStringWithRange:carid Value1:10 Value2:2] intValue];
    //日
    int strDay = [[StaticTools getStringWithRange:carid Value1:12 Value2:2] intValue];
    
    
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init]  autorelease];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeZone:localZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01",strYear,strMonth,strDay]];
    if (date == nil) {
        
        return NO;
    }
    
    const char *PaperId  = [carid UTF8String];
    
    //检验长度
    if( 18 != strlen(PaperId)) return -1;
    //校验数字
    for (int i=0; i<18; i++)
    {
        if ( !isdigit(PaperId[i]) && !(('X' == PaperId[i] || 'x' == PaperId[i]) && 17 == i) )
        {
            return NO;
        }
    }
    //验证最末的校验码
    for (int i=0; i<=16; i++)
    {
        lSumQT += (PaperId[i]-48) * R[i];
    }
    if (sChecker[lSumQT%11] != PaperId[17] )
    {
        return NO;
    }
    
    return YES;
}












