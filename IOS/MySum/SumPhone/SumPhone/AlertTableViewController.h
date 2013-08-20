

#import <UIKit/UIKit.h>
#import "ViewBase.h"

@interface AlertTableViewController : ViewBase <UIAlertViewDelegate,UITableViewDelegate,UITableViewDataSource> {
	UITableView *myTableView;
	NSArray *array;
	NSIndexPath	*lastIndexPath;
	
}

@property (nonatomic, retain) NSIndexPath *lastIndexPath;

-(void)btnClick:sender;

@end

