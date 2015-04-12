//
//  GTWebViewController.m
//  TransientWatch
//
//  Created by Robert Henetz on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTWebViewController.h"

@interface GTWebViewController ()

@property(strong, nonatomic) UIWebView* webView;
@property(strong, nonatomic) NSURL* url;

@end

@implementation GTWebViewController

- (instancetype)initWithURL:(NSURL *)url {
  self = [super init];
  if (self) {
    self.url = url;
    [self setupWebView];
  }
  
  return self;
}

- (void)setupWebView {
  self.webView = [UIWebView new];
  self.webView.frame = self.view.bounds;
  
  [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

@end
