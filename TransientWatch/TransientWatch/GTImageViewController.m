//
//  GTImageViewController.m
//  TransientWatch
//
//  Created by Emma He on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTImageViewController.h"
#import "GTWebViewController.h"
#import "UIImageView+AFNetworking.h"
#import "GTFavoritesManager.h"
#import "MBProgressHUD.h"

NSString* const urlBase = @"http://galactic-titans.herokuapp.com/map?location=";
NSString* const imageBaseURL = @"http://galactic-titans.herokuapp.com/preview?location=";

@interface GTImageViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *ascentionDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *declenationDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *todayDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *yesterdayDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *changeDataLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;

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
  [self.imageView setUserInteractionEnabled:YES];
  UITapGestureRecognizer * gestureRecognizer =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)];
  [self.imageView addGestureRecognizer:gestureRecognizer];
    
    
    
    
    self.favoriteButton.layer.cornerRadius = 10;
    self.favoriteButton.backgroundColor = [UIColor clearColor];
    [self.favoriteButton addTarget:self action:@selector(favoriteButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)favoriteButtonTapped:(id)sender {
  if (![self.favoriteButton.imageView.image isEqual:[UIImage imageNamed:@"StarHighlighted.png"]]) {
    [GTFavoritesManager addFavorites:self.event.name successBlock:^{
      return;
    } failureBlock:^(NSError *error) {
      return;
    }];
    
    [self.favoriteButton setImage:[UIImage imageNamed:@"StarHighlighted.png"] forState:UIControlStateNormal];
  }
}

-(void)imageViewTapped:(UITapGestureRecognizer*)sender{
  NSString* webViewURL = [[NSString stringWithFormat:@"%@%@", urlBase, self.event.name] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  GTWebViewController* webViewController = [[GTWebViewController alloc] initWithURL:[NSURL URLWithString:webViewURL]];
  webViewController.view.frame = self.view.bounds;
  [self.navigationController pushViewController:webViewController animated:YES];
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
  NSDateFormatter* dateFormatter = [NSDateFormatter new];
  dateFormatter.dateFormat = @"MMMM, dd";
  self.dateLabel.text = [dateFormatter stringFromDate:[NSDate date]];
  
  [MBProgressHUD showHUDAddedTo:self.imageView animated:YES];
  NSString* imageURL = [[NSString stringWithFormat:@"%@%@", imageBaseURL, self.event.name] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  [self.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imageURL]]
                        placeholderImage:nil
                                 success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                   [MBProgressHUD hideAllHUDsForView:self.imageView animated:YES];
                                   self.imageView.image = image;
                                   return;
                                 }
                                 failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                   [MBProgressHUD hideAllHUDsForView:self.imageView animated:YES];
                                   return;
                                 }];
  
  if (self.event.difference >= 0) {
    self.arrowLabel.image = [UIImage imageNamed:@"UpArrow"];
  } else {
    self.arrowLabel.image = [UIImage imageNamed:@"DownArrow"];
  }
}

@end
