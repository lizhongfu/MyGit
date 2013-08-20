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
//    http://localhost:8888/Imgs/img0.png
//    http://theme.blogcn.com/wp-content/themes/coffee-desk/images/rsscoffee.PNG
    
    NSString *imgURLStr = nil;
    if ((indexPath.row % 2) == 0)
    {
        imgURLStr = @"http://localhost:8888/Imgs/img0.png";
    } else
    {
        imgURLStr = @"http://localhost:8888/Imgs/img1.png";
    }
    
    GCDHelper *hp = [GCDHelper new];
    [hp gcdImageWithURLString:imgURLStr
                   completion:^(id object1, id object2) {
                    
                       dispatch_async(dispatch_get_main_queue(), ^{
                           UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
                           [(UIImageView *)[cell viewWithTag:10] setImage:(UIImage *)object1];
                       });
                   }];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark -
#pragma mark - cell重用

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
