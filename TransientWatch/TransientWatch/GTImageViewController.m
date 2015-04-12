//
//  GTImageViewController.m
//  TransientWatch
//
//  Created by Emma He on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTImageViewController.h"

@interface GTImageViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ascentionDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *declenationDataLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *todayDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *yesterdayDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *changeDataLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowLabel;

@end

@implementation GTImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer * gestureRecognizer =[[UITapGestureRecognizer alloc] initWithTarget:self.webView action:@selector(webViewTapped:)];
    
    
}



-(void)webViewTapped:(UITapGestureRecognizer*)sender{
    printf("webViewTapped");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
