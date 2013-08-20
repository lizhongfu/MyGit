//
//  SimpleYRotationViewController.m
//  SimpleYRotation
//
//  Created by Matt Long on 10/16/10.
//  Copyright 2010 Skye Road Systems, Inc. All rights reserved.
//

#import "SimpleYRotationViewController.h"

#define degreesToRadians(x) (M_PI * x / 180.0)

@implementation SimpleYRotationViewController

+ (NSString *)friendlyName {
    return @"UILayer翻转效果";
}

- (void)viewDidLoad
{
  [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    anchorPointSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(BaseFrame.origin.x, BaseFrame.origin.y, BaseFrame.size.width/5, BaseFrame.size.height/10)];
    [anchorPointSwitch addTarget:self action:@selector(toggleSwitch:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:anchorPointSwitch];
    
   
  rotationLayer = [CALayer layer];
  [rotationLayer setBounds:CGRectMake(0.0f, 0.0f, 200.0f, 300.0f)];
  [rotationLayer setPosition:CGPointMake([[self view] bounds].size.width/2.0f, [[self view] bounds].size.height / 2.0f)];
  [rotationLayer setBorderWidth:5.0f];
  [rotationLayer setBackgroundColor:[[UIColor orangeColor] CGColor]];
  [[[self view] layer] addSublayer:rotationLayer];
  
  [self performAnimation];
}
- (void)performAnimation;
{
  CATransform3D transform = CATransform3DIdentity;
  transform.m34 = -1.0f / 300.0f;  
  transform = CATransform3DRotate(transform, degreesToRadians(90), 0.0f, 1.0f, 0.0f);

  if ([anchorPointSwitch isOn])
    [rotationLayer setAnchorPoint:CGPointMake(0.0, 0.5)];
  else 
    [rotationLayer setAnchorPoint:CGPointMake(0.5, 0.5)];
    
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
  [animation setFromValue:(id)[NSValue valueWithCATransform3D:[rotationLayer transform]]];
  [animation setToValue:(id)[NSValue valueWithCATransform3D:transform]];
  [animation setRepeatCount:HUGE_VAL];
  [animation setDuration:2.5f];
  
  [rotationLayer addAnimation:animation forKey:@"transform"];
}

- (void)toggleSwitch:(id)sender;
{
  [rotationLayer removeAllAnimations];
  [self performAnimation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return YES;
}

- (void)dealloc
{
  [super dealloc];
}

@end
