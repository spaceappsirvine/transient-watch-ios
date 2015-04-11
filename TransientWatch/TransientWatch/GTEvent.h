//
//  GTEvent.h
//  TransientWatch
//
//  Created by Robert Henetz on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GTFetchEventsSuccessBlock)(NSArray* evenets);
typedef void (^GTFetchEventsFailureBlock)(NSError* error);

@interface GTEvent : UIView

@property(copy, nonatomic) NSString* name;
@property(copy, nonatomic) NSString* type;
@property(strong, nonatomic) NSURL* imageURL;
@property(copy, nonatomic) NSString* rightAscension;
@property(copy, nonatomic) NSString* declenation;
@property(assign, nonatomic) NSInteger todayReading;
@property(assign, nonatomic) NSInteger yesterdayReading;
@property(assign, nonatomic, readonly) NSInteger difference;

- (instancetype)initWithDictionary:(NSDictionary *)json;

+ (void)fetchEvents:(GTFetchEventsSuccessBlock)successBlock failureBlock:(GTFetchEventsFailureBlock)failureBlock;

@end
