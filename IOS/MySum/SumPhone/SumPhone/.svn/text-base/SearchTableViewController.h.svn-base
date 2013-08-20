//
//  SearchTableViewController.h
//  SearchTable
//
//  Created by Zogful Lee on 12-5-5.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>{
    
    UITableView *myTableView;
    NSMutableArray *dataArray;
    NSMutableArray *filteredArray;
    
    UISearchBar *searchBar;
    UISearchDisplayController *searchDC;
    
    
}

@property (nonatomic, retain) IBOutlet UITableView *myTableView;

@property (nonatomic, retain) UISearchBar *searchBar;
@property (nonatomic, retain) UISearchDisplayController *searchDC;

@property (nonatomic, retain) NSMutableArray *dataArray;
@property (nonatomic, retain) NSMutableArray *filteredArray;

@end
