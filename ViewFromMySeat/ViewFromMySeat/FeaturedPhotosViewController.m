//
//  FeaturedPhotosViewController.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhotosViewController.h"
#import "ViewFromMySeatAPI.h"
#import "FeaturedPhotosStore.h"
#import "VenuesStore.h"
#import "FeaturedPhoto.h"
#import "Venue.h"

@interface FeaturedPhotosViewController ()

@end

@implementation FeaturedPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FeaturedPhotosStore * featuredPhotosStore = [[FeaturedPhotosStore alloc] init];
    VenuesStore * venueStore = [[VenuesStore alloc] init];
    
    [featuredPhotosStore fetchFeaturedPhotosInPage:@"1" withCompletion:^(NSArray * featuredPhotos) {
        FeaturedPhoto *firstFP = featuredPhotos[0];
        [venueStore fetchVenueWithName:firstFP.venue withCompletion:^(Venue * venue) {
            [venueStore fetchVenueImageWithPath:venue.imagePath withCompletion:^(UIImage * image) {
                NSLog(@"%@", image);
            }];
        }];
    }];
}


@end
