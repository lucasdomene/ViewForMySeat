//
//  FeaturedPhotosViewController.m
//  ViewForMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhotosViewController.h"
#import "ViewForMySeatAPI.h"

@interface FeaturedPhotosViewController ()

@end

@implementation FeaturedPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL * featuredPhotosURL = [ViewForMySeatAPI featuredPhotosURLWithPage: @"1"];
    NSLog(@"%@", featuredPhotosURL);
    
    NSURL * venueDetailsURL = [ViewForMySeatAPI venueDetailsURLWithVenue: @"Madison Square Garden"];
    NSLog(@"%@", venueDetailsURL);
    
    NSURL * featuredPhotosImageURL = [ViewForMySeatAPI featuredPhotoImageURLWithImageName:@"gjward06-20160723153247.jpg"];
    NSLog(@"%@", featuredPhotosImageURL);
    
    NSURL * venueDetailsImageURL = [ViewForMySeatAPI venueDetailsImageURLWithImageName:@"anonymous-20160912183209.jpg"];
    NSLog(@"%@", venueDetailsImageURL);
}

@end
