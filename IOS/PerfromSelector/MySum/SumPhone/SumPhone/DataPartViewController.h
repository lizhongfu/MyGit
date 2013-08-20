//
//  DataPartViewController.h
//  SumPhone
//
//  Created by Zogful Lee on 12-7-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewManager.h"
#import "DataManager.h"

@interface DataPartViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    DataManager *dataManager_;
}

@end
