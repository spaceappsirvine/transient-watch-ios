//
//  GTEvent.h
//  TransientWatch
//
//  Created by Robert Henetz on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GTEvent : UIView

@property(copy, nonatomic) NSString* name;
@property(strong, nonatomic) NSURL* imageURL;
@property(copy, nonatomic) NSString* rightAscension;
@property(copy, nonatomic) NSString* declenation;
@property(assign, nonatomic) NSInteger todayReading;
@property(assign, nonatomic) NSInteger yesterdayReading;
@property(assign, nonatomic, readonly) NSInteger difference;

- (instancetype)initWithDictionary:(NSDictionary *)json;

@end
