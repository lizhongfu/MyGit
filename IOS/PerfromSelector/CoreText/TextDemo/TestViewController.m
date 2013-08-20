//
//  TestViewController.m
//  TextDemo
//
//  Created by Zogful.Lee on 13-3-4.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction) showText:(id)sender
{
    [textString resignFirstResponder];
    [keyString resignFirstResponder];
    
    CHLabel *label = [[CHLabel alloc] initWithFrame:CGRectMake(10, 260, 300, 200)];
    
    [label setUserInteractionEnabled:YES];
    [label setText:textString.text andKeyWord:keyString.text];
    [label setTextColor:[UIColor redColor] andKeyWordColor:[UIColor blueColor]];
    [label setTextUnderlineStyle:kCHLabelUnderlineStyleSingle andKeyWordUnderlineStyle:kCHLabelUnderlineStyleDouble];
    [label setTextFont:[UIFont systemFontOfSize:20] andKeyWordFont:[UIFont boldSystemFontOfSize:30]];
    label.backgroundColor = [UIColor lightGrayColor];
    [label setNumberOfLines:0];
    label.delegate = self;
    
    
    NSArray *fontArray = [UIFont familyNames];
    NSString *fontName;
    if ([fontArray count]) {
        fontName = [fontArray objectAtIndex:0];
    }
    [label setFont:[UIFont fontWithName:fontName size:20]];
    
    [self.view addSubview:label];
//    [label setNeedsDisplay];
    [label release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark CHLabelDelegate
- (void) CHLabel:(CHLabel *) chLabel tapOnKeyWord:(NSString *) keyWord
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"notice"
                                                    message:[NSString stringWithFormat:@"Tap on keyWord:%@", keyWord]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

@end
