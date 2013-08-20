//
//  ViewPartViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewPartViewController.h"

@interface ViewPartViewController ()

@end

@implementation ViewPartViewController


- (void) dealloc {
    [viewManager_ release];
    
    [super dealloc];
}


-(id)init {  
    if ([super init] != nil) {  
        viewManager_ = [[ViewManager alloc] init];
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
    
    self.title = @"界面";
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
   
    return [viewManager_ groupCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     
    return [viewManager_ sampleCountForGroup:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [viewManager_ groupTitleAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NSString *theTitle = [viewManager_ sampleNameAtIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:theTitle];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theTitle] autorelease];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = theTitle;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[viewManager_ sampleForIndexPath:indexPath] animated:YES];
}

@end
