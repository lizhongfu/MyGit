//
//  RegexHelper.h
//  RegexDemo
//
//  Created by Zogful.Lee on 13-3-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#define _IF_LOG_RESULT_  NO

@interface RegexHelper : NSObject

#pragma mark 验证方法

/*打印待验证字符串和符合条件的子字符串*/ 
+ (void) logResultWithPatternStr:(NSString *) patternStr inputString:(NSString *) inputString;


//验证字符串中存在数字 0-9
+ (BOOL) validateDigitalWithInputString:(NSString *) inputString;

//验证字符串中存在中文
+ (BOOL) validateChineseWithInputString:(NSString *) inputString;

//验证字符串长度，字符串中可以包含除了换行以外
+ (BOOL) validateLengthOfString:(NSString *) inputStr maxLength:(uint) maxLength minLength:(uint) minLengt;

/*验证字符串中存在数字，存在中文，以字母开始（包括下划线）、长度范围*/
+ (BOOL) validateString:(NSString *) inputStr
                digital:(BOOL      ) allowDigital
                chinese:(BOOL      ) allowChinese
              startAlph:(BOOL      ) startWithAlphabet
              maxLength:(uint      ) maxLength
              minLength:(uint      ) minLength;

//校验用户邮箱
+ (BOOL) validateEmail:(NSString *) str;

//移动电话号码 15998069861
+ (BOOL) validateMobilePhoneNum:(NSString *) str;

//校验电话号码 “XXXX-XXXXXXX”，“XXXX-XXXXXXXX”，“XXX-XXXXXXX”，“XXX-XXXXXXXX”，“XXXXXXX”，“XXXXXXXX”
+ (BOOL) validatePhoneNum:(NSString *) str;

//校验腾讯QQ号，QQ号从10000开始
+ (BOOL) validateQQNum:(NSString *) str;

//校验中国邮政编码 6位数字
+ (BOOL) validatePostcode:(NSString *) str;

//校验身份证 中国的身份证为18位,最后一位允许为X
+ (BOOL) validateIdentityCards:(NSString *) str;
int Chk18PaperId (const char *sPaperId);

//校验IP
+ (BOOL) validateIP:(NSString *) str;

//校验网址 http://www.baidu.com
+ (BOOL) validateWebsite:(NSString *) str;

//校验日期 YYYY-MM-DD YYYY/MM/DD YYYY_MM_DD YYYY.MM.DD
+ (BOOL) validateDate:(NSString *) str;

@end




