//
//  BDScrollWebView.m
//  WebViewFlip
//
//  Created by Zogful Lee on 12-4-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BDScrollWebView.h"


@interface BDScrollWebView (Privite)

@end

@implementation BDScrollWebView

@synthesize urlsArray;
@synthesize baseScrollView;
@synthesize baseWebView;

- (void) dealloc {
    [urlsArray release];
    [baseScrollView release];
    [baseWebView release];
    
    [super dealloc];
}

- (id) init{
    if (self = [super init]) {
        urlsArray = [[NSMutableArray alloc] init];
        viewRect = BaseFrame;
        
        self.view.frame = viewRect;
    }
    
    return self;
}

- (void) creatScrollAndWebView {
    
    //    Creat the scrollView
    self.baseScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, viewRect.size.width, viewRect.size.height)];
    
    
    
    baseScrollView.contentOffset = CGPointMake(0.0, 0.0);
    
    baseScrollView.pagingEnabled = YES;
    baseScrollView.delegate = self;
    
    baseScrollView.alwaysBounceHorizontal = NO;
    baseScrollView.alwaysBounceVertical = NO;
    
    baseScrollView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    
    //    Creat the webView
    self.baseWebView = [[UIWebView alloc] init];
    baseWebView.delegate = self;
    baseWebView.frame = CGRectMake(0, 0, viewRect.size.width, viewRect.size.height);
    baseWebView.userInteractionEnabled = YES;
    baseWebView.scalesPageToFit = YES;
    
    
    [baseScrollView addSubview:baseWebView];
    [self.view addSubview:baseScrollView];
    
}

- (void) setWebView {
//    NSLog(@"urlsArray:%@", self.urlsArray);
    if ([urlsArray count] > 0) {
        self.baseScrollView.contentSize = CGSizeMake(viewRect.size.width * [urlsArray count], viewRect.size.height);
    } else {
        self.baseScrollView.contentSize = CGSizeMake(viewRect.size.width, viewRect.size.height);
    }
    
    NSString *urlString = [urlsArray objectAtIndex:0];
    NSURL *url = [NSURL URLWithString:urlString];
	[self.baseWebView loadRequest:[NSURLRequest requestWithURL:url]]; 
    
}

+ (BDScrollWebView *) creatWebviewWithUrls:(NSMutableArray *) array 
                                     frame:(CGRect) aFrame {
    
    BDScrollWebView *webView = [[BDScrollWebView alloc] init];
    [webView.urlsArray addObjectsFromArray:array];
    
    [webView setWebView];
    
    return webView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    update = YES;
    
    [self creatScrollAndWebView];
}

- (void) viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma ScrollView delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    scrollOffset = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int offLength = abs(scrollView.contentOffset.x - scrollOffset);
    
    if (offLength >= viewRect.size.width) {
        update = YES;
    } else {
        update = NO;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (update) {
        NSURLRequest *aRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]];
        [baseWebView loadRequest:aRequest];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (update) {
        int page = (int)scrollView.contentOffset.x/viewRect.size.width;
        
        baseWebView.frame = CGRectMake(page * viewRect.size.width, 0, viewRect.size.width, viewRect.size.height);
        
        NSString *urlString = [NSString stringWithString:[urlsArray objectAtIndex:page]];
        NSURL *url = [NSURL URLWithString:urlString];
        
        [baseWebView stopLoading];
        [baseWebView loadRequest:[NSURLRequest requestWithURL:url]];
    }
}


#pragma WebView delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

@end
