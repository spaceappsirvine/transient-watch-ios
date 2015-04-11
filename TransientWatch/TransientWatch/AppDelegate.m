//
//  AppDelegate.m
//  TransientWatch
//
//  Created by Robert Henetz on 4/10/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
  [navController.navigationBar setBarTintColor:[UIColor blackColor]];
  [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                         NSForegroundColorAttributeName : [UIColor whiteColor],
                                                         NSFontAttributeName : [UIFont systemFontOfSize:24.0f]
                                                         }];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = navController;
  self.window.rootViewController.view.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  
  return YES;
}

@end
