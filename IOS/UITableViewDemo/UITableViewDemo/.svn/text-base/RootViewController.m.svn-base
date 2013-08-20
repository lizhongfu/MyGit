//
//  RootViewController.m
//  UITableViewDemo
//
//  Created by Zogful.Lee on 13-4-4.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RootViewController.h"
#import "TableViewController.h"

@interface RootViewController ()
{
    NSMutableArray *dataArray;
}
@end

@implementation RootViewController

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
    
    dataArray = [NSMutableArray arrayWithObjects:@"Cell异步下载图片", nil];
    [dataArray retain];
    
    self.clearsSelectionOnViewWillAppear = NO;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     TableViewController *detailViewController = [[TableViewController alloc] init];
    
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
}

@end
