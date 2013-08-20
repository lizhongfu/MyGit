//
//  TableViewAdornmentsViewController.m
//  TableViewAdornments
//
//  Created by Matt Long on 10/14/10.
//  Copyright 2010 Skye Road Systems, Inc. All rights reserved.
//

#import "TableViewAdornmentsViewController.h"
#import <QuartzCore/QuartzCore.h>

#ifdef DEBUG
#define DLog(...) NSLog(@"%s(%x) %@", __PRETTY_FUNCTION__, self, [NSString stringWithFormat:__VA_ARGS__])
#define ALog(...) [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__]
#else
#define DLog(...) do { } while (0)
#ifndef NS_BLOCK_ASSERTIONS
#define NS_BLOCK_ASSERTIONS
#endif
#define ALog(...) NSLog(@"%s(%x) %@", __PRETTY_FUNCTION__, self, [NSString stringWithFormat:__VA_ARGS__])
#endif

#define ZAssert(condition, ...) do { if (!(condition)) { ALog(__VA_ARGS__); }} while(0)

#define ISRETINADISPLAY (([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) ? [[UIScreen mainScreen] scale] > 1.0 : NO)

#define degreesToRadians(x) (M_PI * x / 180.0)

@implementation TableViewAdornmentsViewController

+ (NSString *)friendlyName {
    return @"UILayer倒影";
}

- (void) buildTable {
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, BaseFrame.size.width/2, BaseFrame.size.height/2) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.center = self.view.center;
    
    [self.view addSubview:tableView];
    [tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    items = [[NSMutableArray alloc] init];
    [items addObject:@"Red"];
    [items addObject:@"Orange"];
    [items addObject:@"Yellow"];
    [items addObject:@"Green"];
    [items addObject:@"Blue"];
    [items addObject:@"Indigo"];
    [items addObject:@"Violet"];
    
    [self buildTable];
    
    [self decorate];
}

- (void)dealloc
{
    [items release], items = nil;
    [tableView release];
    [super dealloc];
}

- (void)decorate;
{
    [[tableView layer] setBorderWidth:5.0f];
    [[tableView layer] setBorderColor:[[UIColor darkGrayColor] CGColor]];
    [[tableView layer] setMasksToBounds:YES];
    [[tableView layer] setCornerRadius:12.0f];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setContentsGravity:kCAGravityResizeAspect];
    
    [gradientLayer setBounds:CGRectMake(0.0f, 
                                        0.0f, 
                                        [[self view] bounds].size.width, 
                                        [[self view] bounds].size.height)];
    
    [gradientLayer setPosition:CGPointMake([[self view] bounds].size.width/2.0, 
                                           [[self view] bounds].size.height/2.0)];
    
    //  [gradientLayer setColors:[NSArray arrayWithObjects:
    //                            (id)[[UIColor colorWithRed:128.0/255.0 
    //                                                 green:128.0/255.0 
    //                                                  blue:0.0/255.0 
    //                                                 alpha:1.0] 
    //                                 CGColor],
    //                            (id)[[UIColor colorWithRed:128.0/255.0 
    //                                                 green:180.0/255.0 
    //                                                  blue:0.0/255.0 
    //                                                 alpha:1.0] 
    //                                 CGColor], nil]];
    
    [gradientLayer setColors:[NSArray arrayWithObjects:
                              (id)[[UIColor redColor] CGColor],
                              (id)[[UIColor orangeColor] CGColor],
                              (id)[[UIColor yellowColor] CGColor],
                              (id)[[UIColor greenColor] CGColor],
                              (id)[[UIColor blueColor] CGColor],
                              (id)[[UIColor purpleColor] CGColor],
                              (id)[[UIColor colorWithRed:244.0/255.0 
                                                   green:127.0/255.0 
                                                    blue:255.0/255.0 
                                                   alpha:1.0] 
                                   CGColor], nil]];
    
    [[[self view] layer] insertSublayer:gradientLayer atIndex:0];
    
    
    UIGraphicsBeginImageContext([tableView bounds].size);
    [[tableView layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *reflectionImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CALayer *reflectionLayer = [CALayer layer];
    [reflectionLayer setBounds:[tableView bounds]];
    [reflectionLayer setContents:(id)[reflectionImage CGImage]];
    [reflectionLayer setAnchorPoint:CGPointMake(0.5, 1.0)];
    [reflectionLayer setContentsGravity:kCAGravityResizeAspectFill];
    [reflectionLayer setPosition:CGPointMake(
                                             [tableView center].x, 
                                             [tableView center].y + 
                                             [tableView bounds].size.height / 2.0f)];
    
    gradientLayer = [CAGradientLayer layer];
    [gradientLayer setBounds:CGRectMake(0.0f, 
                                        0.0f, 
                                        [tableView bounds].size.width, 
                                        [tableView bounds].size.height)];
    
    [gradientLayer setPosition:CGPointMake([tableView bounds].size.width/2.0, 
                                           [tableView bounds].size.height/2.0)];
    
    [gradientLayer setColors:[NSArray arrayWithObjects:
                              (id)[[UIColor clearColor] CGColor],
                              (id)[[UIColor blackColor] CGColor], nil]];
    
    
    [gradientLayer setStartPoint:CGPointMake(0.5f, 0.75f)];
    [gradientLayer setEndPoint:CGPointMake(0.5f, 1.0f)];
    
    [reflectionLayer setMask:gradientLayer];
    
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, degreesToRadians(180), 1.0f, 0.0f, 0.0f);
    
    [reflectionLayer setTransform:transform];
    
    [[[self view] layer] addSublayer:reflectionLayer];
    
    
}

#pragma mark -
#pragma mark UITableView Delegates

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell;
	
	cell = [tv dequeueReusableCellWithIdentifier:@"Cell"];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"Cell"] autorelease];
	}
	
	[[cell textLabel] setText:[items objectAtIndex:[indexPath row]]];
	
	return cell;
	
}



@end
