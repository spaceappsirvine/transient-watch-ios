//
//  AppDelegate.m
//  TransientWatch
//
//  Created by Robert Henetz on 4/10/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [self setupNavigationController];
  return YES;
}

- (void)setupNavigationController {
  UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
  navController.navigationBar.translucent = YES;
  CGRect navigationBarFrame = navController.navigationBar.frame;
  navigationBarFrame.origin.y = -20;
  navigationBarFrame.size.height += 20;
  UIView* navbarBackground = [[UIView alloc] initWithFrame:navigationBarFrame];
  navbarBackground.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f];
  [navController.navigationBar addSubview:navbarBackground];
  navController.navigationBar.translucent = YES;
  
  [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                         NSForegroundColorAttributeName : [UIColor whiteColor],
                                                         NSFontAttributeName : [UIFont systemFontOfSize:24.0f]
                                                         }];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = navController;
  self.window.rootViewController.view.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
}

@end
