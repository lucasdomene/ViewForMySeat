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

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    FeaturedPhotosViewController * vc = (FeaturedPhotosViewController *)self.window.rootViewController;
    vc.featuredPhotoStore = [FeaturedPhotosStore new];
    return YES;
}

@end
