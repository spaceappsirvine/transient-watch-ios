//
//  GTWebViewController.m
//  TransientWatch
//
//  Created by Robert Henetz on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTWebViewController.h"
#import "MBProgressHUD.h"

@interface GTWebViewController () <UIWebViewDelegate>

@property(strong, nonatomic) UIWebView* webView;
@property(strong, nonatomic) NSURL* url;

@end

@implementation GTWebViewController

- (instancetype)initWithURL:(NSURL *)url {
  self = [super init];
  if (self) {
    self.url = url;
  }
  
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor blackColor];
  
  self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GalacticTitansLogo@2px"]];
  
  UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"navigation-bar.back", nil)
                                                               style:UIBarButtonItemStylePlain
                                                              target:nil
                                                              action:nil];
  [self.navigationItem setBackBarButtonItem:backItem];
  
  [self setupWebView];
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)setupWebView {
  self.webView = [UIWebView new];
  self.webView.delegate = self;
  self.webView.frame = self.view.bounds;
  
  [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
  [self.view addSubview:self.webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
  
  UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                  message:error.localizedDescription
                                                 delegate:nil
                                        cancelButtonTitle:@"Ok"
                                        otherButtonTitles:nil];
  [alert show];
}

@end
