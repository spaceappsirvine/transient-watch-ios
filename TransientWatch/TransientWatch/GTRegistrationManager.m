//
//  GTRegistrationManager.m
//  TransientWatch
//
//  Created by Robert Henetz on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTRegistrationManager.h"
#import "GTHTTPRequestOperationManager.h"

NSString* const registrationURL = @"http://galactic-titans.herokuapp.com/register";

@implementation GTRegistrationManager

+ (void)registerEmail:(NSString *)email
       andPhoneNumber:(NSString *)phoneNumber
         successBlock:(GTRegistrationManagerSuccessBlock)successBlock
         failureBlock:(GTRegistrationManagerFailureBlock)failureBlock {
  
  NSDictionary* params = @{
                           @"email" : email,
                           @"phone" : phoneNumber,
                           @"type" : @"all",
                           };
  
  [GTHTTPRequestOperationManager httpRequestWithMethod:GTHTTPRequestMethodPOST
                                             urlString:registrationURL
                                                params:params
                                               success:^(id responseObject) {
                                                 if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                                   successBlock(responseObject);
                                                 }
                                                 
                                                 return;
                                               }
                                               failure:^(NSError *error) {
                                                 UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"Server Error"
                                                                                                      message:error.localizedDescription
                                                                                                     delegate:nil
                                                                                            cancelButtonTitle:@"Ok"
                                                                                            otherButtonTitles:nil];
                                                 [errorAlert show];
                                                 return;
                                               }];
}

@end
