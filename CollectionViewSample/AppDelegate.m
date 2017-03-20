//
//  AppDelegate.m
//  CollectionViewSample
//
//  Created by jackiege on 15/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "ImageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    FirstViewController *first = [[FirstViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:first];
    homeNav.tabBarItem.title = @"Home";
    homeNav.tabBarItem.badgeColor = [UIColor redColor];
    homeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Home-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.tabBarItem.image = [UIImage imageNamed:@"Home-2"];
    
    ImageViewController *imageVC = [[ImageViewController alloc] init];
    UINavigationController *imageNav = [[UINavigationController alloc] initWithRootViewController:imageVC];
    imageNav.tabBarItem.title = @"Photo";
    imageNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Pic-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    imageNav.tabBarItem.image = [UIImage imageNamed:@"Pic-2"];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.viewControllers = @[homeNav, imageNav];
    
    [UINavigationBar appearance].barTintColor = [UIColor greenColor];
    [UINavigationBar appearance].translucent = NO;
    
    // Override point for customization after application launch.
    self.window.rootViewController = tab;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
