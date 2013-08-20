//
//  RootViewCtrl.h
//  opacityAnimationTest
//
//  Created by iori on 09/07/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ViewBase.h"



//#define UIViewAnimation

@interface RootViewCtrl : ViewBase {

	UILabel *labels[4];
	BOOL hiding;
}

- (CAAnimationGroup*) createAnimitonGroup:(CATransform3D)transform opacity:(float)opacity;
@end
