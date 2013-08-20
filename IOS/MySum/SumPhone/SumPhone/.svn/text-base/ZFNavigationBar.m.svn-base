//
//  ZFNavigationBar.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZFNavigationBar.h"

@interface ZFNavigationBar ()

@property (nonatomic, retain) UINavigationItem *navigationItem;;

@end

@implementation ZFNavigationBar

@synthesize navigationItem;


- (id) initWithFrame:(CGRect) barFrame 
               title:(NSString *)title
  rightBarButtonItem:(NSString *)rightBarBtTitle
       rightBtAction:(SEL) rightAction
   leftBarButtonItem:(NSString *)leftBarBtTitle
        leftBtAction:(SEL) leftAction
     ButtonItemStyle:(UIBarButtonItemStyle) barBtStyle
            target:(id) target
{
    
	if (self = [super initWithFrame:barFrame]) {
        
		navigationItem = [[UINavigationItem alloc] initWithTitle:title];
        
		navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:rightBarBtTitle 
                                                                              style:barBtStyle 
                                                                             target:target 
                                                                             action:rightAction] autorelease];
        
		navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:leftBarBtTitle 
                                                                             style:barBtStyle 
                                                                            target:target 
                                                                            action:leftAction] autorelease];
        
		self.barStyle = UIBarStyleBlackOpaque;
        
		[self pushNavigationItem:navigationItem animated:YES];
	}
	
	return self;
}

- (void) dealloc {

	[navigationItem release];
    
    [super dealloc];
}

@end
