//
//  ImageViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-13.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ImageViewController.h"

@interface CustomImageView : UIView

@end

@implementation CustomImageView

- (void) drawRect:(CGRect)rect
{
    UIImage *im = [UIImage imageNamed:@"Icon.png"];
    
    [im drawAtPoint:CGPointMake(150, 50) blendMode:kCGBlendModeNormal alpha:1.0f];
    
    [im drawInRect:CGRectMake(190, 200, 80, 80) blendMode:kCGBlendModeNormal alpha:1.0];
}

@end

@implementation ImageViewController

- (void) loadView
{
    self.view = [(CustomImageView *)[CustomImageView alloc] initWithFrame:[ViewManager mainWindowFrame]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
