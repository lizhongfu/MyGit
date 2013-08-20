//
//  UITextFieldEx.h
//  iQinRen
//
//  Created by xu xiaofei on 12-7-12.
//  Copyright (c) 2012年 7782. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextFieldEx : UITextField<UITableViewDataSource,UITableViewDelegate>
{
    
}

@property(nonatomic,assign)BOOL canDropDown;

@property(nonatomic,assign)BOOL isSaveItem;

@property(nonatomic,retain)NSArray*  suffixList;

@property(nonatomic,retain)UITableView* dropDownBox;

@property(nonatomic,retain)NSMutableArray*     plistArray;

@property(nonatomic,assign)NSInteger maxShowCount;

-(void)loadDropDownBox;

-(void)removeDropDownBox;
@end
