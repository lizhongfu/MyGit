//
//  RootViewController.m
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-2-6.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RootViewController.h"



@interface RootViewController ()
{
    NSArray *myData;
}

@end

@implementation RootViewController

- (void)dealloc
{
    [myData release];
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
	if (self = [super initWithStyle:style])
    {
		myData = @[
             
             @[ @[@"队列的暂停与恢复", @"阻塞与死锁", @"多线程效率比较"], @"（一）GCD的基本概念" ],
             
             @[ @[@"GCD的一些使用方法举例"], @"（二）GCD的基本使用方法" ],
             
             @[ @[@"单例、网络连接判断/监控与GCD", @"网络请求与GCD", @"图片下载与GCD" ], @"（三）GCD的实际应用举例"],
             
             ];
        
        [myData retain];
	}
	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [myData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myData[section][0] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = myData[indexPath.section][0][indexPath.row];
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return myData[section][1];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
//            if (indexPath.row == 0)
//            {
                BaseViewController *vc = [[[BaseViewController alloc] init] autorelease];
                [self.navigationController pushViewController:vc animated:YES];
//            }
            
            break;
        }
        case 1:
        {
            if (indexPath.row == 0)
            {
                OneViewController *vc = [[[OneViewController alloc] init] autorelease];
                [self.navigationController pushViewController:vc animated:YES];
            }
        
            break;
        }
        case 2:
        {
            if (indexPath.row == 0)
            {
                NetGuarder *guarder = [NetGuarder shareNetGuarder];
                guarder;
            }
            else if (indexPath.row == 1)
            {
                URLConViewController *vc = [[[URLConViewController alloc] init] autorelease];
                [self.navigationController pushViewController:vc animated:YES];
            }
            else if (indexPath.row == 2)
            {
                TableViewController *vc = [[[TableViewController alloc] init] autorelease];
                [self.navigationController pushViewController:vc animated:YES];
            }
            else if (indexPath.row == 3)
            {
                
            }
            
            break;
        }
        
        default:
            break;
    }
    
}

@end
