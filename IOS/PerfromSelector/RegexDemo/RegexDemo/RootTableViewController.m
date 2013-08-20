//
//  RootTableViewController.m
//  RegexDemo
//
//  Created by Zogful.Lee on 13-3-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RootTableViewController.h"

#define CELL_HEIGHT  60
#define kTextFieldTag 10
#define kLabelTag    20

@interface RootTableViewController ()
{
    NSMutableArray *dataArray;
}

@property (nonatomic, retain) NSMutableArray *dataArray;

@end

@implementation RootTableViewController
@synthesize dataArray;


- (void) dealloc
{
    [dataArray release];
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    self.clearsSelectionOnViewWillAppear = NO;
    
    self.dataArray = [NSMutableArray arrayWithObjects:
                      @"校验用户名",
                      @"校验邮箱",
                      @"电话号码",
                      @"移动电话号码",
                      @"QQ号码",
                      @"邮编",
                      @"身份证",
                      @"IP",
                      @"网址",
                      @"日期",
                      @"字符串结尾",
                      nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArray == nil) return 0;
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        float width  = cell.frame.size.width;
        float height = CELL_HEIGHT;
        
        float clearance = 10;
        UITextField *inputTV = [[UITextField alloc] initWithFrame:
                                CGRectMake(clearance, 0, width-80, height)];
        inputTV.tag = kTextFieldTag;
        inputTV.font = [UIFont boldSystemFontOfSize:20];
        inputTV.backgroundColor = [UIColor brownColor];
        inputTV.textAlignment = NSTextAlignmentLeft;
        inputTV.autocapitalizationType = UITextAutocapitalizationTypeNone;
        inputTV.delegate = self;
        [cell addSubview:inputTV];
        
        UILabel *showLb = [[UILabel alloc] initWithFrame:CGRectMake(width-80+clearance, 0, 80-clearance*2, height)];
        showLb.tag = kLabelTag;
        showLb.backgroundColor = [UIColor viewFlipsideBackgroundColor];
        showLb.text = @"验证";
        showLb.textColor = [UIColor whiteColor];
        showLb.textAlignment = NSTextAlignmentCenter;
        
        [cell addSubview:showLb];
    }
    
    UITextField *tv = (UITextField *)[cell viewWithTag:kTextFieldTag];
    tv.placeholder = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGHT;
}

- (void) noticeResult:(NSString *) text flag:(BOOL) flag
{
    NSString *notice = nil;
    if (flag) notice = @"正确";
    else      notice = @"错误";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@结果", text]
                                                    message:notice
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell != nil) {
        UITextField *tv = (UITextField *)[cell viewWithTag:kTextFieldTag];
        if (tv != nil) {
            if ([tv canResignFirstResponder]) {
                [tv resignFirstResponder];
            }
        } else
        {
            return;
        }
        
        switch (indexPath.row) {
                
            case 0:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:0]
                              flag:[RegexHelper validateString:tv.text digital:NO chinese:YES startAlph:YES maxLength:0 minLength:0]];
                break;
            case 1:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:1]
                              flag:[RegexHelper validateEmail:tv.text]];
                break;
            case 2:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:2]
                              flag:[RegexHelper validatePhoneNum:tv.text]];
                break;
            case 3:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:3]
                              flag:[RegexHelper validateMobilePhoneNum:tv.text]];
                break;
            case 4:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:4]
                              flag:[RegexHelper validateQQNum:tv.text]];
                break;
            case 5:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:5]
                              flag:[RegexHelper validatePostcode:tv.text]];
                break;
            case 6:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:6]
                              flag:[RegexHelper validateIdentityCards:tv.text]];
                break;
            case 7:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:7]
                              flag:[RegexHelper validateIP:tv.text]];
                break;
            case 8:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:8]
                              flag:[RegexHelper validateWebsite:tv.text]];
                break;
            case 9:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:9]
                              flag:[RegexHelper validateDate:tv.text]];
                break;
            case 10:
                [self noticeResult:(NSString *)[self.dataArray objectAtIndex:10]
                              flag:[RegexHelper validateHasSuffix:tv.text]];
                break;
            default:
                break;
        }
    }
}

#pragma mark - UITextView delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

@end
