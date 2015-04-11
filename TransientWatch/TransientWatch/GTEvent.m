//
//  GTEvent.m
//  TransientWatch
//
//  Created by Robert Henetz on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTEvent.h"
#import "GTHTTPRequestOperationManager.h"

@implementation GTEvent

- (instancetype)initWithDictionary:(NSDictionary *)json {
  self = [super init];
  if (self) {
    self.name = [json objectForKey:@"designation"];
    self.type = [json objectForKey:@"type"];
    self.imageURL = [NSURL URLWithString:[json objectForKey:@"image"]];
    self.rightAscension = [json objectForKey:@"ra"];
    self.declenation = [json objectForKey:@"dec"];
    self.todayReading = [[json objectForKey:@"today"] integerValue];
    self.yesterdayReading = [[json objectForKey:@"yesterday"] integerValue];
  }
  
  return self;
}

- (NSInteger)difference {
  return self.todayReading - self.yesterdayReading;
}

#pragma mark - Network Calls

+ (void)fetchEvents:(GTFetchEventsSuccessBlock)successBlock failureBlock:(GTFetchEventsFailureBlock)failureBlock {
  
  [GTHTTPRequestOperationManager httpRequestWithMethod:GTHTTPRequestMethodGET
                                             urlString:@""
                                                params:nil
                                               success:^(id responseObject) {
                                                 
                                                 if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                                   NSMutableArray* events = [NSMutableArray new];
                                                   
                                                   for (NSDictionary* eventJSON in [responseObject objectForKey:@"results"]) {
                                                     GTEvent* event = [[GTEvent alloc] initWithDictionary:eventJSON];
                                                     [events addObject:event];
                                                   }
                                                   
                                                   successBlock([events copy]);
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
                                               }];
  
}

@end
