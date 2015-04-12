//
//  GTRegisterViewController.m
//  TransientWatch
//
//  Created by Emma He on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTRegisterViewController.h"
#import "GTDataViewController.h"
#import "GTEvent.h"

@interface GTRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *EmailTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation GTRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:41.0f/255.0f green:68.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
  self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GalacticTitansLogo@2px"]];

    self.submitButton.layer.cornerRadius = 12;
    self.submitButton.backgroundColor = [UIColor colorWithRed:0.404 green:0.259 blue:0.545 alpha:1];
    self.submitButton.titleLabel.textColor = [UIColor whiteColor];
//  UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"navigation-bar.back", nil)
//                                                               style:UIBarButtonItemStylePlain
//                                                              target:nil
//                                                              action:nil];
//  [self.navigationItem setBackBarButtonItem:backItem];

  
  UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"navigation-bar.back", nil)
                                                               style:UIBarButtonItemStylePlain
                                                              target:nil
                                                              action:nil];
  [self.navigationItem setBackBarButtonItem:backItem];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  //  self.navigationController.navigationBar.translucent = YES;
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


-(BOOL)NSStringIsValidPhoneNumber: (NSString*)checkString{
    
    NSError *error = NULL;
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber error:&error];
    
    NSRange inputRange = NSMakeRange(0, [checkString length]);
    NSArray *matches = [detector matchesInString:checkString options:0 range:inputRange];
        if ([matches count] == 0) {
        return NO;
    }
    NSTextCheckingResult *result = (NSTextCheckingResult *)[matches objectAtIndex:0];
    
    if ([result resultType] == NSTextCheckingTypePhoneNumber && result.range.location == inputRange.location && result.range.length == inputRange.length) {
        return YES;
    }else {
        return NO;
    }
    
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}




- (IBAction)submitButtontapped:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString * phoneNum = self.phoneNumTextField.text;
   
    NSString * email = self.EmailTextField.text;
    
            
            
            if ([self NSStringIsValidEmail:email]){
                [defaults setObject:email forKey:@"Email"];
                 [defaults setObject:phoneNum forKey:@"phoneNum"];
                GTDataViewController *dataViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
                [self presentViewController:dataViewController animated:YES completion:nil];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Email" message:@"Please enter a valid email address." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"Cancel", nil];
                [alert show];
                
            }

    
    
    
    [defaults synchronize];
    
    
}

- (IBAction)skipButtontapped:(id)sender {
  [GTEvent fetchEvents:^(NSArray *evenets) {
    return;
  } failureBlock:^(NSError *error) {
    return;
  }];
    
    
    
  

}



@end
