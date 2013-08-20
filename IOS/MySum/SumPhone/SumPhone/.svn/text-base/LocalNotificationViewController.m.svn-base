//
//  LocalNotificationViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LocalNotificationViewController.h"

@interface LocalNotificationViewController ()

@end

@implementation LocalNotificationViewController

+ (NSString *)friendlyName {
    return @" 多任务＋本地通知";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
    UIDevice* device = [UIDevice currentDevice];
	BOOL backgroundSupported = NO;
	if ([device respondsToSelector:@selector(isMultitaskingSupported)])
		backgroundSupported = device.multitaskingSupported;
	
	NSLog(@"backgroundSupported[%@]",backgroundSupported ? @"YES" : @"NO");	
	
	NSDate *oneMinuteFromNow = [NSDate dateWithTimeIntervalSinceNow:10];
	NSLog(@"At[%@]will show alert~!", oneMinuteFromNow);
	[self scheduleAlarmForDate:oneMinuteFromNow];
    
	[self performSelector:@selector(justExitApp) withObject:nil afterDelay:3];
}

- (void)justExitApp {
	
	exit(0);
}

#pragma mark -
#pragma mark Background Task Handle
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
	// Request permission to run in the background. Provide an 
	// expiration handler in case the task runs long.
	NSAssert(self->bgTask == UIBackgroundTaskInvalid, nil);
	
	self->bgTask = [application beginBackgroundTaskWithExpirationHandler: ^{
		// Synchronize the cleanup call on the main thread in case
		// the task catully finished at around the same time.
		dispatch_async(dispatch_get_main_queue(), ^{
			
			if (UIBackgroundTaskInvalid != self->bgTask) {
				
				[application endBackgroundTask:self->bgTask];
				self->bgTask = UIBackgroundTaskInvalid;
			}
		});
	}];
	
	// Start the long-running task and return immediately.
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), 
				   ^{
					   // Do the work assoicated with the task.
					   
					   // Synchronize the cleanup all on the main thread in case
					   // the task catully finished at around the same time. 
					   dispatch_async(dispatch_get_main_queue(), ^{
						   
						   if (UIBackgroundTaskInvalid != self->bgTask) {
                               
							   [application endBackgroundTask:self->bgTask];
							   self->bgTask = UIBackgroundTaskInvalid;
						   }
					   });
				   });
}

#pragma mark -
#pragma mark Local Notifications
- (void)scheduleAlarmForDate:(NSDate *)theDate {
	
	UIApplication *app = [UIApplication sharedApplication];
	NSArray *oldNotifications = [app scheduledLocalNotifications];
	
	// Clear out the old notification before scheduling a new one.
	if (0 < [oldNotifications count]) {
		
		[app cancelAllLocalNotifications];
	}
	
	// Create a new notification
	UILocalNotification *alarm = [[UILocalNotification alloc] init];
	if (alarm) {
        
		alarm.fireDate = theDate;
		alarm.timeZone = [NSTimeZone defaultTimeZone];
		alarm.repeatInterval = 0;
		alarm.soundName = @"ping.caf";//@"default";
		alarm.alertBody = [NSString stringWithFormat:@"Time to wake up!Now is\n[%@]", 
						   [NSDate dateWithTimeIntervalSinceNow:10]];
		
		[app scheduleLocalNotification:alarm];
		[alarm release];
	}
} 


@end
