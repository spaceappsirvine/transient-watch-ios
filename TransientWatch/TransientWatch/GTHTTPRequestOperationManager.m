//
//  GTHTTPRequestOperationManager.m
//  RedditFeed
//
//  Created by Robert Henetz on 3/17/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"

@implementation GTHTTPRequestOperationManager

static GTHTTPRequestOperationManager* shared;

+ (GTHTTPRequestOperationManager *)sharedInstance {
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    shared = [[GTHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@""]];
  });
  
  return shared;
}

- (void)allowBadSSL{
  AFSecurityPolicy* policy = [[AFSecurityPolicy alloc] init];
  policy.allowInvalidCertificates = YES;
  self.securityPolicy = policy;
}

- (id)initWithBaseURL:(NSURL*)url {
  self = [super initWithBaseURL:url];
  if (self) {
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    [self allowBadSSL];
  }
  
  return self;
}

#pragma mark - AFHTTPRequestOperationManager methods

- (AFHTTPRequestOperation *)HTTPRequestOperationWithRequest:(NSURLRequest *)request
                                                    success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
                                                    failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure
{
  
  NSMutableURLRequest *mutableRequest = [request mutableCopy];
  [mutableRequest addValue:@"application/vnd.amgr.v1.0+json" forHTTPHeaderField:@"Accept"];
  //[mutableRequest addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  
  return [super HTTPRequestOperationWithRequest:[mutableRequest copy] success:success failure:failure];
}

+ (void)httpRequestWithMethod:(GTHTTPRequestMethod)method
                    urlString:(NSString *)urlString
                       params:(NSDictionary *)parameters
                      success:(GTHTTPRequestSuccessBlock)successBlock
                      failure:(GTHTTPRequestFailureBlock)failureBlock {
  GTHTTPRequestOperationManager* sharedInstance = [GTHTTPRequestOperationManager sharedInstance];
  NSMutableURLRequest* request = [sharedInstance.requestSerializer requestWithMethod:[GTHTTPRequestOperationManager httpMethodStringWithMethod:method]
                                                                           URLString:urlString
                                                                          parameters:parameters
                                                                               error:nil];
  AFHTTPRequestOperation* operation = [sharedInstance HTTPRequestOperationWithRequest:request
                                                                              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                                                successBlock(responseObject);
                                                                              }
                                                                              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                                                failureBlock(error);
                                                                              }];
  [sharedInstance.operationQueue addOperation:operation];
}

#pragma mark - Helpers

+ (NSString *)httpMethodStringWithMethod:(GTHTTPRequestMethod)requestMethod {
  switch (requestMethod) {
    case GTHTTPRequestMethodGET:
      return @"GET";
      break;
    case GTHTTPRequestMethodDELETE:
      return @"DELETE";
      break;
    case GTHTTPRequestMethodPATCH:
      return @"PATCH";
      break;
    case GTHTTPRequestMethodPOST:
      return @"POST";
      break;
    case GTHTTPRequestMethodPUT:
      return @"PUT";
      break;
  }
}

@end
