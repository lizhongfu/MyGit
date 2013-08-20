//
//  ManagerBase.h
//  SumPhone
//
//  Created by Zogful Lee on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewBase.h"

@interface ManagerBase : NSObject {
    NSMutableArray *samples_;
    NSMutableArray *groups_;
}

- (NSUInteger) groupCount;
- (NSUInteger) sampleCountForGroup:(NSUInteger) group;
- (NSString *) groupTitleAtIndex:(NSUInteger) index;
- (NSString *) sampleNameAtIndexPath:(NSIndexPath *) indexPath;
- (UIViewController *) sampleForIndexPath:(NSIndexPath *) indexPath;

@end
