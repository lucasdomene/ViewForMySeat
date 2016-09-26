//
//  AppDelegate.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "AppDelegate.h"
#import "FeaturedPhotosViewController.h"
#import "FeaturedPhotosStore.h"
#import "VenuesStore.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UINavigationController * nav = (UINavigationController *)self.window.rootViewController;
    FeaturedPhotosViewController * vc = (FeaturedPhotosViewController *)nav.topViewController;
    vc.featuredPhotoStore = [FeaturedPhotosStore new];
    vc.venuesStore = [VenuesStore new];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    return YES;
}

@end
