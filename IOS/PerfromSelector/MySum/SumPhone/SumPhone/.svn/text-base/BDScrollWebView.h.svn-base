//
//  BDScrollWebView.h
//  WebViewFlip
//
//  Created by Zogful Lee on 12-4-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface BDScrollWebView : UIViewController <UIScrollViewDelegate, UIWebViewDelegate, MBProgressHUDDelegate> {
    NSMutableArray *urlsArray;
    
    CGRect viewRect;
    UIScrollView *baseScrollView;
    UIWebView *baseWebView;
    
    BOOL update;
    float scrollOffset;
    
}

@property (nonatomic, retain) NSMutableArray *urlsArray;
@property (nonatomic, retain) UIScrollView *baseScrollView;
@property (nonatomic, retain) UIWebView *baseWebView;

+ (BDScrollWebView *) creatWebviewWithUrls:(NSMutableArray *) array frame:(CGRect) aFrame;

@end
