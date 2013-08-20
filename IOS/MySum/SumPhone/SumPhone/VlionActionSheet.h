//
//  VlionActionSheet.h
//  TestActionSheet
//
//  Created by Cui Lionel on 10-12-8.
//  Copyright 2010 vlion. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VlionActionSheetDelegate

- (void)clickedButtonAtIndex;

@end

@interface VlionActionSheet : UIActionSheet 
{
	UIToolbar* toolBar;
	UIView* view;
	id <VlionActionSheetDelegate> ACDelegate;
}

@property(nonatomic,retain)UIView* view;
@property(nonatomic,retain)UIToolbar* toolBar;
@property(nonatomic,retain)id <VlionActionSheetDelegate> ACDelegate;

-(id)initWithHeight:(float)height WithSheetTitle:(NSString*)title;

@end

