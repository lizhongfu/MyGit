

#import "UIAlertTableView.h"

#define kTablePadding 8.0f


@interface UIAlertView (private)
- (void)layoutAnimated:(BOOL)fp8;
@end

@implementation UIAlertTableView

@synthesize dataSource;
@synthesize tableDelegate;
@synthesize tableHeight;
@synthesize tableView;

- (void)drawRect:(CGRect)rect {

	[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y - tableExtHeight/2, self.frame.size.width, self.frame.size.height + tableExtHeight+13)];
	
	// We get the lowest non-control view (i.e. Labels) so we can place the table view just below
	UIView *lowestView;
	int i = 0;
	while (![[self.subviews objectAtIndex:i] isKindOfClass:[UIControl class]]) {
		lowestView = [self.subviews objectAtIndex:i];
		i++;
	}
	
	CGFloat tableWidth = 262.0f;
	
	tableView.frame = CGRectMake(11.0f, lowestView.frame.origin.y + lowestView.frame.size.height + 2 * kTablePadding, tableWidth, tableHeight);
	
	for (UIView *sv in self.subviews) {
		// Move all Controls down
		if ([sv isKindOfClass:[UIControl class]]) {
			sv.frame = CGRectMake(sv.frame.origin.x, sv.frame.origin.y + tableExtHeight, sv.frame.size.width, sv.frame.size.height);
		}
	}
	
}

- (void)show{
	[self prepare];
    [super show];
}

- (void)prepare {
	if (tableHeight == 0) {
		tableHeight = 150.0f;
	}
	
	tableExtHeight = tableHeight + 2 * kTablePadding;
	
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 0.0f) style:UITableViewStylePlain];
	tableView.backgroundColor = [UIColor orangeColor];
	tableView.delegate = tableDelegate;
	tableView.dataSource = dataSource;	
	
	[self insertSubview:tableView atIndex:0];
	
	[self setNeedsDisplay];
}

- (void)dealloc {
	[tableView release];
    [super dealloc];
}

@end
