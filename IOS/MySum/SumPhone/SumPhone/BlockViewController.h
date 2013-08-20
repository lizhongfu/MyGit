//
//  BlockViewController.h
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewBase.h"
#import "string.h"

@interface BlockViewController : ViewBase

@end


/*******************************基础知识*********************
 
 脱字符(^)
 
 声明一个块：float (^block)(const int*, int, float);
 
 
 声明一个块，然后赋值。int (^block)(int); block = ^(int aVarible) { return 0; };  
 */