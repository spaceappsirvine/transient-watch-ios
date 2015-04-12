//
//  GTFavoritesManager.h
//  TransientWatch
//
//  Created by Robert Henetz on 4/12/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^GTFavoritesSuccessBlock)(NSArray* events);
typedef void (^GTFavoritesFailureBlock)(NSError* error);
typedef void (^GTAddFavoriteSuccessBlock)();
typedef void (^GTAddFavoriteFailureBlock)(NSError* error);

@interface GTFavoritesManager : NSObject

+ (instancetype)sharedInstance;

@property (copy, nonatomic) NSString* UUID;

+ (void)fetchFavorites:(GTFavoritesSuccessBlock)successBlock failureBlock:(GTFavoritesFailureBlock)failureBlock;
+ (void)addFavorites:(NSString *)name
        successBlock:(GTAddFavoriteSuccessBlock)successBlock
        failureBlock:(GTAddFavoriteFailureBlock)failureBlock;

@end
