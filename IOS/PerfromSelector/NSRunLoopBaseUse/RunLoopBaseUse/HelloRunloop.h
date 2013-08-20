//
//  HelloRunloop.h
//  RunLoopBaseUse
//
//  Created by Zogful.Lee on 13-4-5.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelloRunloop : NSObject {
    volatile BOOL propTest0;
    NSString* propTest1;
}

- (void) run:(id)arg;
- (void) observerRunLoop;
- (void) wakeUpMainThreadRunloop:(id)arg;
- (IBAction)start:(id)sender;

@end
