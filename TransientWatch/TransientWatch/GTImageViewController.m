//
//  GTImageViewController.m
//  TransientWatch
//
//  Created by Emma He on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTImageViewController.h"
#import "GTWebViewController.h"

NSString* const urlBase = @"http://galactic-titans.herokuapp.com/map?location=";

@interface GTImageViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ascentionDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *declenationDataLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *todayDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *yesterdayDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *changeDataLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;


@end

@implementation GTImageViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GalacticTitansLogo@2px"]];
  
  UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"navigation-bar.back", nil)
                                                               style:UIBarButtonItemStylePlain
                                                              target:nil
                                                              action:nil];
  [self.navigationItem setBackBarButtonItem:backItem];
  
  [self style];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)style {
  self.nameLabel.text = self.event.name;
  self.typeLabel.text = self.event.type;
  self.ascentionDataLabel.text = self.event.rightAscension;
  self.declenationDataLabel.text = self.event.declenation;
  self.todayDataLabel.text = [NSString stringWithFormat:@"%ld", (long)self.event.todayReading];
  self.yesterdayDataLabel.text = [NSString stringWithFormat:@"%ld", (long)self.event.yesterdayReading];
  self.changeDataLabel.text = [NSString stringWithFormat:@"%ld", (long)self.event.difference];
  NSString* theURL = [[NSString stringWithFormat:@"%@%@", urlBase, self.event.name] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:theURL]]];
  if (self.event.difference >= 0) {
    self.arrowLabel.image = [UIImage imageNamed:@"UpArrow"];
  } else {
    self.arrowLabel.image = [UIImage imageNamed:@"DownArrow"];
  }
}



@end
