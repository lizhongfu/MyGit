//
//  TestView.m
//  DeleteAnimationTest
//
//  Created by lixiaoxiao on 11-6-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestView.h"

#define MaxTagNumber 999

@implementation TestView


- (id)initWithFrame:(CGRect)frame withNumber:(NSInteger)theNumber {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		UILabel *theNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2, 50,
																			frame.size.width/2, 50)];
		theNumberLabel.text = [NSString stringWithFormat:@"%d", theNumber];
		theNumberLabel.tag = MaxTagNumber;
		[self addSubview:theNumberLabel];
		[theNumberLabel release];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
