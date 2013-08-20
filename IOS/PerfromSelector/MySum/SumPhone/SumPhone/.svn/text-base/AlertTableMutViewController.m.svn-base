//
//  AlertTableMutViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AlertTableMutViewController.h"
#import "UIAlertMutTableView.h"

@interface AlertTableMutViewController ()

@end

@implementation AlertTableMutViewController

+ (NSString *)friendlyName {
    return @"UIAlert多选";
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	array = [[NSArray alloc] initWithObjects:@"test1",@"test2",@"test3",@"test4",nil];
    [super viewDidLoad];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt.frame = CGRectMake(0, 0, BaseFrame.size.width/5, BaseFrame.size.width/8);
    [self.view addSubview:bt];
    bt.center = self.view.center;
    
    [bt addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick:sender
{
	UIAlertMutTableView *alert = [[UIAlertMutTableView alloc] initWithTitle:@"Select Option"
                                                                    message:nil
                                                                   delegate:self
                                                          cancelButtonTitle:@"Cancel"
                                                          otherButtonTitles:@"Do", nil];
	alert.tableDelegate = self;
	alert.dataSource = self;
	alert.tableHeight = 120;
	[alert show];
	[alert release];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [array count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.textLabel.text = [array objectAtIndex:indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
	printf("User Pressed Button %d\n",buttonIndex+1);
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	NSInteger row=[indexPath row];
	if (row==0) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
		cell.textLabel.textColor=[UIColor redColor];
		NSLog(@"-----text---,%@",cell.textLabel.text);
	}
	
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	//NSLog(@"----hello----,%@",indexPath);
	return indexPath;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	
	[tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	
	if (cell.accessoryType == UITableViewCellAccessoryNone)		{
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
		cell.textLabel.textColor=[UIColor redColor];
		NSLog(@"-----text---,%@",cell.textLabel.text);
	}
	else if (cell.accessoryType == UITableViewCellAccessoryCheckmark)	{
		cell.accessoryType = UITableViewCellAccessoryNone;
		cell.textLabel.textColor=[UIColor blackColor];
		
	}
	
}

- (void)dealloc {
	[array release];
    [super dealloc];
}

@end
