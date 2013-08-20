//
//  RootViewController.m
//  Graphics
//
//  Created by Zogful.Lee on 13-2-10.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "RootViewController.h"
#import "GraphicsViewController.h"
#import "ColorViewController.h"
#import "ImageViewController.h"
#import "LineDrawViewController.h"
#import "PathDrawViewController.h"
#import "RectangleViewController.h"
#import "RectanglesViewController.h"
#import "shadowViewController.h"
#import "GradientViewController.h"
#import "Gradient1ViewController.h"
#import "TransformViewController.h"
#import "TranslateCTMViewController.h"
#import "ScaleViewController.h"
#import "RotationViewController.h"
#import "AnimationViewController.h"
#import "Animation1ViewController.h"
#import "ShapesViewController.h"
#import "DrawViewController.h"

@interface RootViewController () {
    UITableView *_gTableView;
    NSMutableArray *_dataSouceArray;
}

@end

@implementation RootViewController

- (void) dealloc {
    
    [_gTableView release];
    [_dataSouceArray release];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _dataSouceArray = [[NSMutableArray alloc] initWithObjects:
                       @"枚举字体族科/每个族科所有字体",
                       @"绘制文本",
                       @"CGColor",
                       @"绘制图片",
                       @"绘制线条",
                       @"构造路径",
                       @"绘制矩形",
                       @"绘制多个矩形",
                       @"阴影",
                       @"渐变（一）",
                       @"渐变（二）",
                       @"平移变换",
                       @"CTM平移变换",
                       @"缩放图形上下文中的形状",
                       @"旋转图形上下文中的形状",
                       @"动画",
                       @"组合动画",
                       @"绘制几个形状",
                       @"涂鸦绘图", nil];

    _gTableView = [[UITableView alloc] initWithFrame:[ViewManager viewFrameWithout_footerBar]];
    _gTableView.delegate = self;
    _gTableView.dataSource = self;
    
    [self.view addSubview:_gTableView];
    [_gTableView reloadData];
}

#pragma mark -
#pragma mark 枚举字体族科/每个族科所有字体
- (void) enumerateFonts
{
    for (NSString *familyName in [UIFont familyNames])
    {
        NSLog(@"Font Family = %@", familyName);
        
        //      每个族科中所有字体名称
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName])
        {
            NSLog(@"\t%@", fontName);
        }
    }
}

#pragma mark -
#pragma mark 绘制文本
- (void) drawText
{
    GraphicsViewController *vc = [[GraphicsViewController alloc] init];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 颜色分量
- (void) colorStudy
{
    ColorViewController *vc = [[ColorViewController alloc] init];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 图片绘制
- (void) imageStudy
{
    ImageViewController *vc = [ImageViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 线条绘制
- (void) lineDrawStudy
{
    LineDrawViewController *vc = [LineDrawViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 路径绘制
- (void) pathDrawStudy
{
    PathDrawViewController *vc = [PathDrawViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 绘制矩形
- (void) rectangleDrawStudy
{
    RectangleViewController *vc = [RectangleViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 绘制多个矩形
- (void) rectanglesDrawStudy
{
    RectanglesViewController *vc = [RectanglesViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 为形状添加阴影
- (void) shadowDrawStudy
{
    shadowViewController *vc = [shadowViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 创建和绘制渐变
- (void) gradientDrawStudy
{
    GradientViewController *vc = [GradientViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 创建和绘制渐变1
- (void) gradient1DrawStudy
{
    Gradient1ViewController *vc = [Gradient1ViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 变换
- (void) transformDrawStudy
{
    TransformViewController *vc = [TransformViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark CTM变换
- (void) transformCTMDrawStudy
{
    TranslateCTMViewController *vc = [TranslateCTMViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 缩放
- (void) scaleDrawStudy
{
    ScaleViewController *vc = [ScaleViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 旋转
- (void) rotationDrawStudy
{
    RotationViewController *vc = [RotationViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 动画
- (void) animationDrawStudy
{
    AnimationViewController *vc = [AnimationViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 动画-组合动画
- (void) animation1DrawStudy
{
    Animation1ViewController *vc = [Animation1ViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 绘制几个形状
- (void) shapesDrawStudy
{
    ShapesViewController *vc = [ShapesViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark 涂鸦绘图
- (void) imageDrawStudy
{
    DrawViewController *vc = [DrawViewController new];
    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSouceArray count];
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    else
        cell.textLabel.text = @"";
    
    
    cell.textLabel.font = [UIFont fontWithName:@"Thonburi-Bold" size:15];
    
    if (indexPath.row < _dataSouceArray.count) {
        cell.textLabel.text = [_dataSouceArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self enumerateFonts];
            break;
            
        case 1:
            [self drawText];
            break;
            
        case 2:
            [self colorStudy];
            break;
            
        case 3:
            [self imageStudy];
            break;
            
        case 4:
            [self lineDrawStudy];
            break;

        case 5:
            [self pathDrawStudy];
            break;

        case 6:
            [self rectangleDrawStudy];
            break;
            
        case 7:
            [self rectanglesDrawStudy];
            break;
            
        case 8:
            [self shadowDrawStudy];
            break;

        case 9:
            [self gradientDrawStudy];
            break;
            
        case 10:
            [self gradient1DrawStudy];
            break;
            
        case 11:
            [self transformDrawStudy];
            break;
            
        case 12:
            [self transformCTMDrawStudy];
            break;
            
        case 13:
            [self scaleDrawStudy];
            break;
            
        case 14:
            [self rotationDrawStudy];
            break;
            
        case 15:
            [self animationDrawStudy];
            break;
            
        case 16:
            [self animation1DrawStudy];
            break;
            
        case 17:
            [self shapesDrawStudy];
            break;
            
        case 18:
            [self imageDrawStudy];
            break;
            
        default:
            break;
    }
}

@end
