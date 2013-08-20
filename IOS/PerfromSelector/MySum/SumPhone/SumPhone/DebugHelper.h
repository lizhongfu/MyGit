//
//  DebugHelper.h
//  Test
//
//  Created by Zogful Lee on 12-9-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef Test_DebugHelper_h
#define Test_DebugHelper_h

//Base
#define DebugHelperFileName \
[[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lastPathComponent]

#define DebugHelperClassName \
[[DebugHelperFileName componentsSeparatedByString:@"."] objectAtIndex:0]

#define DebugHelperFunctionName \
[NSString stringWithCString:__FUNCTION__ encoding:NSUTF8StringEncoding]

#define DebugHelperMethodName \
[[[DebugHelperFunctionName componentsSeparatedByString:@" "] objectAtIndex:1] substringToIndex:(((NSString *)[[DebugHelperFunctionName componentsSeparatedByString:@" "] objectAtIndex:1]).length -1)]


//Useful

//判断某参数是否为nil，参数为对象类型。
#define DebugHelperWarnNilParameter(Object) \
if (Object == nil) { \
    NSLog(@"DebugHelper:< %@ < %@ < 第(%d)行处参数为nil ;", DebugHelperClassName, DebugHelperMethodName, __LINE__); \
}





#endif
