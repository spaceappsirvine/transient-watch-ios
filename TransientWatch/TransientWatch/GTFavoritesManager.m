//
//  GTFavoritesManager.m
//  TransientWatch
//
//  Created by Robert Henetz on 4/12/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTFavoritesManager.h"
#import "GTHTTPRequestOperationManager.h"
#import "GTEvent.h"

NSString* const getBookmarksURL = @"http://galactic-titans.herokuapp.com/bookmarks?uuid=";
NSString* const postBookmarkURL = @"http://galactic-titans.herokuapp.com/bookmark";

@implementation GTFavoritesManager

static GTFavoritesManager* shared;

+ (instancetype)sharedInstance {
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    shared = [GTFavoritesManager new];
  });
  
  return shared;
}

- (NSString *)UUID {
  NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
  return [defaults objectForKey:@"UUID"];
}

+ (void)fetchFavorites:(GTFavoritesSuccessBlock)successBlock
          failureBlock:(GTFavoritesFailureBlock)failureBlock {
  [GTHTTPRequestOperationManager httpRequestWithMethod:GTHTTPRequestMethodGET
                                             urlString:[NSString stringWithFormat:@"%@%@", getBookmarksURL, [GTFavoritesManager sharedInstance].UUID]
                                                params:nil
                                               success:^(id responseObject) {
                                                 if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                                   NSMutableArray* events = [NSMutableArray new];
                                                   for(NSDictionary* eventJSON in [responseObject objectForKey:@"data"]) {
                                                     GTEvent* event = [[GTEvent alloc] initWithDictionary:eventJSON];
                                                     [events addObject:event];
                                                   }
                                                   
                                                   successBlock([events copy]);
                                                 }
                                                 return;
                                               }
                                               failure:^(NSError *error) {
                                                 UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Server Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                                                 [alert show];
                                                 
                                                 failureBlock(error);
                                                 return;
                                               }];
}

+ (void)addFavorites:(NSString *)name
        successBlock:(GTAddFavoriteSuccessBlock)successBlock
        failureBlock:(GTAddFavoriteFailureBlock)failureBlock {
  NSDictionary* params = @{
                           @"uuid" : [GTFavoritesManager sharedInstance].UUID,
                           @"name" : name
                           };
  
  [GTHTTPRequestOperationManager httpRequestWithMethod:GTHTTPRequestMethodPOST
                                             urlString:postBookmarkURL
                                                params:params
                                               success:^(id responseObject) {
                                                 successBlock();
                                                 return;
                                               }
                                               failure:^(NSError *error) {
                                                 UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Server Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                                                 [alert show];
                                                 
                                                 failureBlock(error);
                                                 return;
                                               }];
}

@end
