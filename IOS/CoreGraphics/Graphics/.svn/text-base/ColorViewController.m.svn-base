//
//  ColorViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-11.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@end

@implementation ColorViewController

+(CGColorRef) getColorFromRed:(int)red Green:(int)green Blue:(int)blue Alpha:(int)alpha
{
    CGFloat r = (CGFloat)   red/255.0;
    CGFloat g = (CGFloat) green/255.0;
    CGFloat b = (CGFloat)  blue/255.0;
    CGFloat a = (CGFloat) alpha/255.0;
    
    CGFloat components[4] = {r, g, b, a};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGColorRef color = (CGColorRef)[(id)CGColorCreate(colorSpace, components) autorelease];
    CGColorSpaceRelease(colorSpace);
    
    return color;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    UIColor *steelBlueColor = [UIColor colorWithRed:0.3f green:0.4f blue:0.6f alpha:1.0f];
    UIColor *steelBlueColor = [UIColor colorWithCGColor:[ColorViewController getColorFromRed:100.0f Green:150.0f Blue:200.0f Alpha:255.0f]];
    
    self.view.backgroundColor = steelBlueColor;
    
    CGColorRef colorRef = [steelBlueColor CGColor];
    
//    组成颜色对象的各个分量
    CGFloat const* components = CGColorGetComponents(colorRef);//返回一个浮点型指针
    
    NSUInteger componentsCount = CGColorGetNumberOfComponents(colorRef);
    
    NSUInteger counter = 0;
    for (counter = 0; counter < componentsCount; counter++) {

        NSLog(@"Component %lu = %.02f", (unsigned long)counter +  1, components[counter]);
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
