//
//  GTHTTPRequestOperationManager.h
//  RedditFeed
//
//  Created by Robert Henetz on 3/17/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

typedef void (^GTHTTPRequestSuccessBlock)(id responseObject);
typedef void (^GTHTTPRequestFailureBlock)(NSError* error);

typedef NS_ENUM(NSUInteger, GTHTTPRequestMethod) {
  GTHTTPRequestMethodGET,
  GTHTTPRequestMethodPOST,
  GTHTTPRequestMethodPUT,
  GTHTTPRequestMethodPATCH,
  GTHTTPRequestMethodDELETE
};

@interface GTHTTPRequestOperationManager : AFHTTPRequestOperationManager

+ (GTHTTPRequestOperationManager *)sharedInstance;

+ (void)httpRequestWithMethod:(GTHTTPRequestMethod)method
                    urlString:(NSString *)urlString
                       params:(NSDictionary *)parameters
                      success:(GTHTTPRequestSuccessBlock)successBlock
                      failure:(GTHTTPRequestFailureBlock)failureBlock;

@end
