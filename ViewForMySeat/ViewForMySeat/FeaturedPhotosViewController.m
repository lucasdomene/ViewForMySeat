//
//  FeaturedPhotosViewController.m
//  ViewForMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhotosViewController.h"
#import "ViewForMySeatAPI.h"
#import "FeaturedPhotosStore.h"
#import "FeaturedPhoto.h"
#import "Venue.h"

@interface FeaturedPhotosViewController ()

@end

@implementation FeaturedPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FeaturedPhotosStore *store = [[FeaturedPhotosStore alloc] init];
    [store fetchFeaturedPhotosInPage:@"1" withCompletion:^(NSArray * featuredPhotos) {
        for (FeaturedPhoto * fp in featuredPhotos) {
            NSLog(@"%@", fp.venue);
        }
    }];
}


@end
