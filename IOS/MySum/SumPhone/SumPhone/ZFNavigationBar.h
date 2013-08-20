//
//  ZFNavigationBar.h
//  SumPhone
//
//  Created by Zogful Lee on 12-7-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFNavigationBar : UINavigationBar


- (id) initWithFrame:(CGRect) barFrame 
               title:(NSString *)title
  rightBarButtonItem:(NSString *)rightBarBtTitle
       rightBtAction:(SEL) rightAction
   leftBarButtonItem:(NSString *)leftBarBtTitle
        leftBtAction:(SEL) leftAction
     ButtonItemStyle:(UIBarButtonItemStyle) barBtStyle
            target:(id) target;

@end
