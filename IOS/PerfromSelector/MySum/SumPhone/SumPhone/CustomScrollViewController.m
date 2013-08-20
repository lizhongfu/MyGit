//
//  CustomScrollViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomScrollViewController.h"


@interface CustomScrollViewController ()

@end

@implementation CustomScrollViewController

+ (NSString *)friendlyName {
    return @"UIScrollView自定义";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
	
    NSMutableArray *pages=[[NSMutableArray alloc]init];
    for(int i=0;i<5;i++) {
        NSString *pathimg=[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"PageScrollView"] ofType:@"png"];
        
        UIImageView *subview=[[UIImageView alloc]initWithFrame:BaseFrame];
        
        UIImage *theImage =[ImageUtil image:[UIImage imageWithContentsOfFile:pathimg] fitInSize:BaseFrame.size] ;
        
        subview.image = theImage;
        
        [pages addObject:subview];
        [subview release];
    }
    
   PageScrollView *scrollView=[[PageScrollView alloc]initWithFrame:self.view.frame];
    scrollView.pages=pages; 
    scrollView.delegate=self;
    
    [self.view addSubview:scrollView];
}

-(void)pageScrollViewDidChangeCurrentPage:(PageScrollView *)pageScrollView
                              currentPage:(int)currentPage {
    
    NSLog(@"Do Somthing");
}

@end
