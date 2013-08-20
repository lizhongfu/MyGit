//
//  SearchTableViewController.m
//  SearchTable
//
//  Created by Zogful Lee on 12-5-5.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "SearchTableViewController.h"
#import "ModelTable.h"

@implementation SearchTableViewController
@synthesize myTableView, dataArray;
@synthesize searchDC, searchBar;
@synthesize filteredArray;

+ (NSString *)friendlyName {
    return @"UITableView搜索";
}

- (void) getData:(id) sender {
    
    for (int i=0; i<15; i++) {
        ModelTable *data = [[[ModelTable alloc] init] autorelease];
        data.name = [NSString stringWithFormat:@"%@", [sender objectAtIndex:i]];
        data.sex = [NSString stringWithFormat:@"sex%d", i];
        
        [dataArray addObject:data];
    }
    
    [self.myTableView reloadData];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = BaseFrame;
    
    NSArray *array = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o", nil];
    
    self.dataArray = [[[NSMutableArray alloc] init] autorelease];
    self.filteredArray = [[[NSMutableArray alloc] init] autorelease];
    
    [self getData:array];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    
    // 建立搜索栏
	self.searchBar = [[[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320, 44.0f)] autorelease];
	self.searchBar.tintColor = [UIColor grayColor];
	self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.searchBar.keyboardType = UIKeyboardTypeAlphabet;
    self.searchBar.placeholder = @"单号、标题、发起人";
    self.searchBar.delegate = self;
    //	self.contentTable.tableHeaderView = self.searchBar;
    [self.view addSubview:self.searchBar];
	
	// Create the search display controller
	self.searchDC = [[[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self] autorelease];
	self.searchDC.searchResultsDataSource = self;
	self.searchDC.searchResultsDelegate = self;

    self.searchDC.delegate = self;

//    [self.myTableView setTableHeaderView:self.searchBar];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.myTableView) {
        return [dataArray count];
    }
    
    return [self.filteredArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCellStyle style =  UITableViewCellStyleDefault;
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BaseCell"];
	if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:style reuseIdentifier:@"BaseCell"] autorelease];
        
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    
    ModelTable *data;
    
    if (tableView == self.myTableView)
        data = [dataArray objectAtIndex:indexPath.row];
    else
        data = [filteredArray objectAtIndex:indexPath.row];
    
    
    NSString *msg = [NSString stringWithFormat:@"%@", data.name];
    
    cell.textLabel.text = msg;
    
//    UIImageView *imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]] autorelease];
//    cell.backgroundView = imageView;
//    
//    UIImageView *iv = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HLbg.png"]] autorelease];
//    cell.selectedBackgroundView = iv;
    
//    cell.contentView.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}



- (void)filterArrayBy:(NSString*) keyword
{
    [self.filteredArray removeAllObjects];
    
    // TITLE IS A KEY IN MY ARRAYLISTDATA(NSDICTIONARY), FOR PURE NSSTRING FILTERING, USE SELF INSTEAD
    NSPredicate *p1 = [NSPredicate predicateWithFormat:@"name contains[cd] %@", keyword];
    NSPredicate *p2 = [NSPredicate predicateWithFormat:@"sex contains[cd] %@", keyword];
    
    NSArray *array1 = [self.dataArray filteredArrayUsingPredicate:p1];
    NSArray *array2 = [self.dataArray filteredArrayUsingPredicate:p2];
    
    
    if ([array1 count] > 0) {
        [self.filteredArray addObjectsFromArray:array1];
    }
    
    if ([array2 count] > 0) {
        [self.filteredArray addObjectsFromArray:array2];
    }
    
    
    [self.searchDC.searchResultsTableView reloadData];
    
    NSLog(@"filteredArray:%@", self.filteredArray);
}

// called when keyboard search button pressed
- (void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar{
    
    [self filterArrayBy:aSearchBar.text];
    [self.searchDC.searchResultsTableView reloadData];
}

- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    
}

// TO SOLVE THE PROBLEM OF LIST BECOMES EMPTY WHENEVER USER STARTS TYPING
- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
{
//    self.filteredArray = self.dataArray;
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView {
    self.myTableView.hidden = YES;
    self.searchDC.searchResultsTableView.backgroundColor = [UIColor clearColor];    
}

- (void)searchDisplayController:(UISearchDisplayController *)controller willUnloadSearchResultsTableView:(UITableView *)tableView {
    self.myTableView.hidden = NO;
}

// LIVE SEARCH
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self filterArrayBy:searchText];
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

}

@end
