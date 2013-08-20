//
//  UITextFieldEx.m
//  iQinRen
//
//  Created by xu xiaofei on 12-7-12.
//  Copyright (c) 2012年 7782. All rights reserved.
//

#import "UITextFieldEx.h"
#define UITEXTFIELDEX  @"UITextFieldEx"

@implementation UITextFieldEx

@synthesize dropDownBox=_dropDownBox;
@synthesize canDropDown=_canDropDown;
@synthesize suffixList=_suffixList;
@synthesize isSaveItem=_isSaveItem;
@synthesize plistArray=_plistArray;
@synthesize maxShowCount=_maxShowCount;
-(CGFloat)rowCount:(NSInteger)count
{
    if (count>self.maxShowCount) {
        return self.maxShowCount*self.frame.size.height;
    }
    else {
        return count*self.frame.size.height;
    }
}

-(UITableView *)dropDownBox
{
    if (!_canDropDown) {
        return nil;
    }
    if ([self.suffixList count]==0) {
        return nil;
    }
    if (_dropDownBox==nil) {
        CGRect rect=self.bounds;
        rect.size.height=[self rowCount:[self.suffixList count]];
        _dropDownBox=[[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
        _dropDownBox.contentSize=CGSizeMake(rect.size.width,rect.size.height*[self.suffixList count]);
        _dropDownBox.rowHeight=self.frame.size.height;
        _dropDownBox.dataSource=self;
        _dropDownBox.delegate=self;
    }
    return _dropDownBox;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _canDropDown=NO;
        self.maxShowCount=3;
        [self addTarget:self action:@selector(textFieldValueHasChange:) forControlEvents:UIControlEventEditingChanged];
        //[self addTarget:self action:@selector(textfieldEndOnExit:) forControlEvents:UIControlEventEditingDidEnd];
        
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    _canDropDown=NO;
    self.maxShowCount=3;
    [self addTarget:self action:@selector(textFieldValueHasChange:) forControlEvents:UIControlEventEditingChanged];
   // [self addTarget:self action:@selector(textfieldEndOnExit:) forControlEvents:UIControlEventEditingDidEnd];
}

-(NSMutableArray *)plistArray
{
    if (_plistArray==nil) {
        NSUserDefaults* userDefault=[NSUserDefaults standardUserDefaults];
        _plistArray=[userDefault objectForKey:UITEXTFIELDEX];
        if (_plistArray==nil) {
            _plistArray=[NSMutableArray arrayWithObjects:@"126.com",@"qq.com",@"163.com",@"7782.com", nil];
        }
    }
    return _plistArray;
}
-(NSArray *)suffixList
{
    if (_suffixList==nil) {
        _suffixList=[NSArray arrayWithArray:self.plistArray];
    }
    return _suffixList;
}
#pragma mark - TableView Delegate DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.suffixList count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier=@"Cell";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSRange range=[self.text rangeOfString:@"@"];
    cell.textLabel.text=[NSString stringWithFormat:@"%@%@",[self.text substringToIndex:range.location+1],[self.suffixList objectAtIndex:indexPath.row]];
    NSLog(@"%@",cell.textLabel.text);
    cell.textLabel.textColor=self.textColor;
    cell.textLabel.font=self.font;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[tableView cellForRowAtIndexPath:indexPath];
    self.text=cell.textLabel.text;
    [self.dropDownBox removeFromSuperview];
}

-(void)loadDropDownBox
{
    if (self.dropDownBox.superview==nil) {
        CGRect rect=self.dropDownBox.bounds;
        rect.origin.x=self.frame.origin.x;
        rect.origin.y=self.frame.origin.y+self.frame.size.height;
        UIView* sv1=self.superview;
        while (sv1!=nil&&!CGRectContainsRect(sv1.bounds,rect))
        {
            UIView* sv2=sv1;
            sv1=sv2.superview;
            rect.origin.x+=sv2.frame.origin.x;
            rect.origin.y+=sv2.frame.origin.y;
        }
        if (sv1!=nil) {
            self.dropDownBox.frame=rect;
            [sv1 addSubview:self.dropDownBox];
        }
    }
}

-(void)removeDropDownBox
{

    [_dropDownBox removeFromSuperview];
}

-(void)reloadDataWithText:(NSString*)str
{
    NSRange range=[str rangeOfString:@"@"];
    if (range.length==0) {
        [self removeDropDownBox];
        return;
    }
    NSString* subStr=[str substringFromIndex:range.location+1];
    if ([subStr length]>0) {
        NSString* regex=[NSString stringWithFormat:@"^%@.+",subStr];
        NSPredicate* predicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        self.suffixList=[self.plistArray filteredArrayUsingPredicate:predicate];
        NSLog(@"%@",self.suffixList);
    }
    else {
        self.suffixList=[NSArray arrayWithArray:self.plistArray];
    }
    if ([self.suffixList count]>0) {
        CGRect rect=self.dropDownBox.frame;
        rect.size.height=[self rowCount:[_suffixList count]];
        _dropDownBox.contentSize=CGSizeMake(rect.size.width,rect.size.height*[self.suffixList count]);
        self.dropDownBox.frame=rect;
        [self.dropDownBox reloadData];
    }
    else {
        [self removeDropDownBox];
    }
}
-(void)textFieldValueHasChange:(id)sender
{
    UITextFieldEx* tfx=sender;
    NSString* string;
    if ([tfx.text length]>[self.text length])//插入文字
    {
        string=tfx.text;
    }
    else//减少文字
    {
        string=tfx.text;
    }
    if (self.canDropDown&&[string rangeOfString:@"@"].length>0) {
        
        [self reloadDataWithText:string];
        [self loadDropDownBox];
    }
    else {
        [self removeDropDownBox];
    }
}
-(void)textfieldEndOnExit:(id)sender
{
    NSRange range=[self.text rangeOfString:@"@"];
    NSString* substr=[self.text substringFromIndex:range.location+1];
    if ([substr length]>0&&self.isSaveItem) {
        [self.plistArray addObject:substr];
        NSUserDefaults* userDefault=[NSUserDefaults standardUserDefaults];
        [userDefault setObject:self.plistArray forKey:UITEXTFIELDEX];
    }
}



@end
