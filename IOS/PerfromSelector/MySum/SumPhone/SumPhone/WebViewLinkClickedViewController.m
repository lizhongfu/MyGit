//
//  WebViewLinkClickedViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WebViewLinkClickedViewController.h"

@interface WebViewLinkClickedViewController ()

@end

@implementation WebViewLinkClickedViewController

@synthesize myWebView;

+ (NSString *)friendlyName {
    return @"UIWebView网页间跳转";
}

- (void) jsCallNative {
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
	NSString *filePath = [resourcePath stringByAppendingPathComponent:@"01.html"];
	NSString *htmlstring=[[NSString alloc] initWithContentsOfFile:filePath  encoding:NSUTF8StringEncoding error:nil];
    myWebView.tag = 10;
	[myWebView loadHTMLString:htmlstring  baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.frame = BaseFrame;
    
    self.myWebView = [[[UIWebView alloc] initWithFrame:BaseFrame] autorelease];
    
    [myWebView setOpaque:NO];
	[myWebView setBackgroundColor:[UIColor clearColor]];
    myWebView.delegate = self;
    myWebView.tag = 100;
    
    [self.view addSubview:myWebView];
    
    [self btnAction];
    
//    打开注释，就是js调客户端
//    [self jsCallNative];
}

-(void) btnAction{
	NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
	NSString *filePath = [resourcePath stringByAppendingPathComponent:@"0.html"];
	NSString *htmlstring=[[NSString alloc] initWithContentsOfFile:filePath  encoding:NSUTF8StringEncoding error:nil];   
	[myWebView loadHTMLString:htmlstring  baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];	
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if (webView.tag == 100) {
        if (navigationType == UIWebViewNavigationTypeLinkClicked) {
            
            self.navigationItem.title = @"More information";
        }
    }
    
    if (webView.tag == 10) {
        NSString *requestString = [[request URL] absoluteString];
		NSArray *components = [requestString componentsSeparatedByString:@":"];
		if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"testapp"]) {
			if([(NSString *)[components objectAtIndex:1] isEqualToString:@"alert"]) 
			{
				UIAlertView *alert = [[UIAlertView alloc] 
                                      initWithTitle:@"Alert from Cocoa Touch" message:[components objectAtIndex:2]
                                      delegate:self cancelButtonTitle:nil
                                      otherButtonTitles:@"OK", nil];
				[alert show];
			}
			return NO;
		}
    }
    
	return YES;
    
    /*UIWebViewNavigationTypeLinkClicked happens if the user taps a <a href=""> style link, if the change is done from within Javascript (onclick event for example) UIWebViewNavigationTypeOther is used.
     
     Furthermore UIWebViewNavigationTypeOther is used if you first load a page or you'll be redirected by a meta refresh or something
     */
}

@end
