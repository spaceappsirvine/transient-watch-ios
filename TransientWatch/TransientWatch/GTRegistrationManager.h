//
//  GTRegistrationManager.h
//  TransientWatch
//
//  Created by Robert Henetz on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GTRegistrationManagerSuccessBlock)();
typedef void (^GTRegistrationManagerFailureBlock)();

@interface GTRegistrationManager : UIView

+ (void)registerEmail:(NSString *)email
       andPhoneNumber:(NSString *)phoneNumber
         successBlock:(GTRegistrationManagerSuccessBlock)successBlock
         failureBlock:(GTRegistrationManagerFailureBlock)failureBlock;

@end
