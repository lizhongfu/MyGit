//
//  SecondViewController.h
//  CoreImageDemo
//
//  Created by Zogful.Lee on 13-3-25.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)loadPhoto:(id)sender;
- (IBAction)amountSliderValueChanged:(UISlider *)slider;
- (IBAction)savePhoto:(id)sender;

@end
