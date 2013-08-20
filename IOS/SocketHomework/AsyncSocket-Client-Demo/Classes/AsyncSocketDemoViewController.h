//
//  AsyncSocketDemoViewController.h
//  AsyncSocketDemo
//
//  Created by Ted Hayes on 3/8/10.
//  Copyright Limina.Studio 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
#import "AsyncUdpSocket.h"

@interface AsyncSocketDemoViewController : UIViewController <AsyncSocketDelegate>{
//	AsyncSocket *asyncSocket;
    AsyncUdpSocket *asyncUdpSocket;
	IBOutlet UIButton* pauseButton;
	IBOutlet UITextView* resultsText;
	IBOutlet UILabel* currentTrack;	
    
    CGPoint midPoint;
    NSTimer *sendTimer;
    BOOL multitouch;
	BOOL finished;
    NSUInteger pointCount;
}

//@property(retain, nonatomic) AsyncSocket *asyncSocket;

- (IBAction) touchPauseButton:(id)sender;

@end

