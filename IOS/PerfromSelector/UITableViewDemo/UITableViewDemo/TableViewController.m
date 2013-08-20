//
//  TableViewController.m
//  UITableViewDemo
//
//  Created by Zogful.Lee on 13-4-4.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "TableViewController.h"
#import "CustomCell.h"
#import <objc/runtime.h>

static char * const kIndexPathAssociationKey = "JK_indexPath";

@interface TableViewController ()

@end

@implementation TableViewController

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
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        UIImageView *im = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        im.tag = 10;
        [cell addSubview:im];
        [im release];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [NSThread detachNewThreadSelector:@selector(updateImageForCellAtIndexPath:) toTarget:self withObject:indexPath];
}

- (void)updateImageForCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    UIImage *image = [self getImageForCellAtIndexPath:indexPath];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [(UIImageView *)[cell viewWithTag:10] performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
    [pool release];
}

- (UIImage *) getImageForCellAtIndexPath:(NSIndexPath *) indexPath
{    
    NSURL *imgUrl = [NSURL URLWithString:@"http://theme.blogcn.com/wp-content/themes/coffee-desk/images/rsscoffee.PNG"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:imgUrl];
    [request setHTTPMethod:@"GET"];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request
                                               returningResponse:nil
                                                           error:nil];
    [request release];
    
    NSLog(@"An Image is created");
    
    return [UIImage imageWithData:returnData];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark -
#pragma mark - 以前的cell重用弱暴了

- (void)tableViewCellIsPreparingForReuse:(NSNotification *)notification
{
	if ([[notification object] isKindOfClass:[CustomCell class]]) {
		CustomCell *cell = (CustomCell *)[notification object];
		
		objc_setAssociatedObject(cell,
								 kIndexPathAssociationKey,
								 nil,
								 OBJC_ASSOCIATION_RETAIN);
		
		[[cell imageView] setImage:nil];
	}
}

@end
