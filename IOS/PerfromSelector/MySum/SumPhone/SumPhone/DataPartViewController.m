//
//  DataPartViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataPartViewController.h"

@interface DataPartViewController ()

@end

@implementation DataPartViewController

- (void) dealloc {
    [dataManager_ release];
    
    [super dealloc];
}


-(id)init {  
    if ([super init] != nil) {  
        dataManager_ = [[DataManager alloc] init];
    }  
    
    return self;  
}

- (void)loadView
{
    UITableView *tbView = [[[UITableView alloc] initWithFrame:BaseFrame style:UITableViewStyleGrouped] autorelease];
    tbView.delegate = self;
    tbView.dataSource = self;
    
    self.view = tbView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma marl-
#pragma mark UITabBarDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [dataManager_ groupCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [dataManager_ sampleCountForGroup:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [dataManager_ groupTitleAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *theTitle = [dataManager_ sampleNameAtIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:theTitle];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theTitle] autorelease];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = theTitle;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[dataManager_ sampleForIndexPath:indexPath] animated:YES];
}
@end
