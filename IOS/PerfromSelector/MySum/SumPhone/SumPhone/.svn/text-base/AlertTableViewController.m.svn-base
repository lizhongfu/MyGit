

#import "AlertTableViewController.h"
#import "UIAlertTableView.h"

@implementation AlertTableViewController

@synthesize lastIndexPath;

+ (NSString *)friendlyName {
    return @"UIAlert单选";
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
	array = [[NSArray alloc] initWithObjects:@"test1",@"test2",@"test3",@"test4",nil];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt.frame = CGRectMake(0, 0, BaseFrame.size.width/5, BaseFrame.size.width/8);
    [self.view addSubview:bt];
    bt.center = self.view.center;
    
    [bt addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick:sender
{
	UIAlertTableView *alert = [[UIAlertTableView alloc] initWithTitle:@"Select Option"
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
	
    
    // Configure the cell...
	
	NSUInteger row = [indexPath row];
	NSUInteger oldRow = [lastIndexPath row];
	cell.textLabel.text = [array objectAtIndex:row];
	cell.accessoryType = (row == oldRow && lastIndexPath != nil) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
	
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
	printf("User Pressed Button %d\n",buttonIndex+1);
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
/*
	NSInteger row=[indexPath row];
	if (row==0) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
		cell.textLabel.textColor=[UIColor redColor];
	}
 */
	
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	//NSLog(@"----hello----,%@",indexPath);
	return indexPath;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	 
	
	int newRow = [indexPath row];
	int oldRow = [lastIndexPath row];

	if ((newRow == 0 && oldRow == 0) || (newRow != oldRow)){
		
		UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
		newCell.accessoryType = UITableViewCellAccessoryCheckmark;
		//newCell.textLabel.textColor=[UIColor redColor];
		
		UITableViewCell *oldCell = [tableView cellForRowAtIndexPath: lastIndexPath]; 
		oldCell.accessoryType = UITableViewCellAccessoryNone;
		//oldCell.textLabel.textColor=[UIColor blackColor];
		lastIndexPath = [indexPath retain];	
		
		NSLog(@"-----text---,%@",newCell.textLabel.text);
	}
	
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	
}

- (void)dealloc {
	[lastIndexPath release];
	[array release];
    [super dealloc];
}

@end
