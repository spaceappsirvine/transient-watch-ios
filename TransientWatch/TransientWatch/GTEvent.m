//
//  GTEvent.m
//  TransientWatch
//
//  Created by Robert Henetz on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTEvent.h"

@implementation GTEvent

- (instancetype)initWithDictionary:(NSDictionary *)json {
  self = [super init];
  if (self) {
    self.name = [json objectForKey:@"designation"];
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

@end
