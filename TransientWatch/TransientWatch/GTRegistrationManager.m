//
//  GTRegistrationManager.m
//  TransientWatch
//
//  Created by Robert Henetz on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTRegistrationManager.h"
#import "GTHTTPRequestOperationManager.h"

@implementation GTRegistrationManager

+ (void)registerEmail:(NSString *)email
       andPhoneNumber:(NSString *)phoneNumber
         successBlock:(GTRegistrationManagerSuccessBlock)successBlock
         failureBlock:(GTRegistrationManagerFailureBlock)failureBlock {
  
  [GTHTTPRequestOperationManager httpRequestWithMethod:GTHTTPRequestMethodPOST
                                             urlString:@""
                                                params:nil
                                               success:^(id responseObject) {
                                                 return;
                                               }
                                               failure:^(NSError *error) {
                                                 return;
                                               }];
}

@end
