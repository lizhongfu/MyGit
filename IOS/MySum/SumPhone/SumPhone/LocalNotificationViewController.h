//
//  LocalNotificationViewController.h
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewBase.h"

@interface LocalNotificationViewController : ViewBase {
    UIBackgroundTaskIdentifier	bgTask;
}

- (void)scheduleAlarmForDate:(NSDate *)theDate;
@end
