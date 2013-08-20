//
//  GraphicsViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-11.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "GraphicsViewController.h"

@interface GraphicsViewControllerView : UIView

@end

@implementation GraphicsViewControllerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIColor *aColor = [UIColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f];
    [aColor set];
    
    UIFont *KannadaSangamMNBold = [UIFont fontWithName:@"HelveticaNeue-Medium" size:40.0f];
    NSString *myStr = @"Some String";
    [myStr drawAtPoint:CGPointMake(40, 180) withFont:KannadaSangamMNBold];
    
    [myStr drawInRect:CGRectMake(0, 0, [ViewManager applicationFrame_width], 30) withFont:KannadaSangamMNBold];
}
@end

@implementation GraphicsViewController

- (void) loadView
{
    self.view = [[(GraphicsViewControllerView *)[GraphicsViewControllerView alloc] init] autorelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	
    self.view.frame = [ViewManager viewFrameWithout_statueBar_headerBar_footerBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
