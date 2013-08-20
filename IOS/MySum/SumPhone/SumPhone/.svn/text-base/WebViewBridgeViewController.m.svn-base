//
//  WebViewBridgeViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WebViewBridgeViewController.h"

@interface WebViewBridgeViewController ()

@end

@implementation WebViewBridgeViewController
@synthesize webView = _webView;
@synthesize javascriptBridge = _javascriptBridge;

+ (NSString *)friendlyName {
    return @"UIWebView桥接库使用";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;

    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    
	self.javascriptBridge = [WebViewJavascriptBridge javascriptBridgeWithDelegate:self];
	self.webView.delegate = self.javascriptBridge;
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setTitle:@"Send message" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view insertSubview:button aboveSubview:self.webView];
	button.frame = CGRectMake(95, 300, 130, 45);
	
	[self.javascriptBridge sendMessage:@"Message from ObjC before Webview is complete!" toWebView:self.webView];
	
	[self loadExamplePage];
	
	[self.javascriptBridge sendMessage:@"Message 2 from ObjC before Webview is complete!" toWebView:self.webView];
}

- (void)buttonPressed:(id)sender {
    [self.javascriptBridge sendMessage:@"Message from ObjC on normal situations!" toWebView:self.webView];
}

- (void)javascriptBridge:(WebViewJavascriptBridge *)bridge receivedMessage:(NSString *)message fromWebView:(UIWebView *)webView {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message from Javascript" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)loadExamplePage {
    [self.webView loadHTMLString:@""
     "<!doctype html>"
     "<html><head>"
     "  <style type='text/css'>h1 { color:red; }</style>"
     "</head><body>"
     "  <h1>Javascript Bridge Demo</h1>"
     "  <script>"
     "  document.addEventListener('WebViewJavascriptBridgeReady', onBridgeReady, false);"
     "  function onBridgeReady() {"
     "      WebViewJavascriptBridge.setMessageHandler(function(message) {"
     "          var el = document.body.appendChild(document.createElement('div'));"
     "          el.innerHTML = message;"
     "      });"
     "      WebViewJavascriptBridge.sendMessage('hello from the JS');"
     "      var button = document.body.appendChild(document.createElement('button'));"
     "      button.innerHTML = 'Click me to send a message to ObjC';"
     "      button.onclick = button.ontouchstart = function() { WebViewJavascriptBridge.sendMessage('hello from JS button'); };"
     "  }"
     "  </script>"
     "</body></html>" baseURL:nil];
}


@end
