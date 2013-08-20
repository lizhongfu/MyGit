//
//  SimpleYRotationViewController.h
//  SimpleYRotation
//
//  Created by Matt Long on 10/16/10.
//  Copyright 2010 Skye Road Systems, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleYRotationViewController : UIViewController {
    CALayer *rotationLayer;
    UISwitch *anchorPointSwitch;
}

- (void)toggleSwitch:(id)sender;
- (void)performAnimation;

@end

