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
}

@end
