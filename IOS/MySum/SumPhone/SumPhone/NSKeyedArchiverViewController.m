//
//  NSKeyedArchiverViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSKeyedArchiverViewController.h"

@interface NSKeyedArchiverViewController ()

@end

@implementation NSKeyedArchiverViewController

+ (NSString *)friendlyName {
    return @"NSKeyedArchiver使用";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    
    NSString *str = @"abc";
    NSString *astr = @"efg";
    NSArray *Array = [NSArray arrayWithObjects:str, astr, nil];
    
    //保存数据
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]; NSString *filename = [Path stringByAppendingPathComponent:@"test"];
    [NSKeyedArchiver archiveRootObject:Array toFile:filename];
  
    //加载数据
    NSArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile: filename];
    str = [arr objectAtIndex:0];
    astr =  [arr objectAtIndex:1];
    
    NSLog(@"str:%@",str);
    NSLog(@"astr:%@",astr);
    
    UILabel *label = [[UILabel alloc] initWithFrame:BaseFrame];
    label.numberOfLines = 0;
    label.text = [NSString stringWithFormat:@"str:%@\nastr:%@\n", str, astr];
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
