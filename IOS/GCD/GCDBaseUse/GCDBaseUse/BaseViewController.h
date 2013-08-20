//
//  BaseViewController.h
//  GCDBaseUse
//
//  Created by Zogful.Lee on 13-4-18.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
    IBOutlet UITextField *field1;
    IBOutlet UITextField *field2;
    IBOutlet UITextField *field3;
    
    IBOutlet UITextField *textField;
    
    dispatch_queue_t queue;
}

- (IBAction) calculate:(id)sender;
- (IBAction) operationQueue:(id)sender;
- (IBAction) gcd:(id)sender;

- (IBAction) notchoke:(id)sender;
- (IBAction) choke:(id)sender;

- (IBAction) getUIData:(id)sender;


- (IBAction)startQueue:(id)sender;
- (IBAction)suspendQueue:(id)sender;
- (IBAction)resumeQueue:(id)sender;

@end
