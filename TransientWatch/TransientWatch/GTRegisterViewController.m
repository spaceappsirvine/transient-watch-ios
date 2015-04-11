//
//  GTRegisterViewController.m
//  TransientWatch
//
//  Created by Emma He on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTRegisterViewController.h"

@interface GTRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *EmailTextField;

@end

@implementation GTRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  CGRect navigationBarFrame = self.navigationController.navigationBar.frame;
  navigationBarFrame.origin.y = -20;
  navigationBarFrame.size.height += 20;
  UIView* navbarBackground = [[UIView alloc] initWithFrame:navigationBarFrame];
  navbarBackground.backgroundColor = [UIColor colorWithRed:97.0f/255.0f green:66.0f/255.0f blue:141.0f/255.0f alpha:1.0f];
  [self.navigationController.navigationBar addSubview:navbarBackground];
  self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GalacticTitansLogo@2px"]];
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
    
    NSString * username = self.phoneNumTextField.text;
    [defaults setObject:username forKey:@"UserName"];
    NSString * email = self.EmailTextField.text;
    
    
    if ([self NSStringIsValidEmail:email]){
        [defaults setObject:email forKey:@"Email"];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Email" message:@"Please enter a valid email address." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
    
    
    [defaults synchronize];
    
    
}

- (IBAction)skipButtontapped:(id)sender {
}



@end
