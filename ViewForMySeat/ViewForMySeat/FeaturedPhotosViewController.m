//
//  FeaturedPhotosViewController.m
//  ViewForMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhotosViewController.h"
#import "ViewForMySeatAPI.h"
#import "FeaturedPhoto.h"

@interface FeaturedPhotosViewController ()

@end

@implementation FeaturedPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FeaturedPhoto *fp = [[FeaturedPhoto alloc] initWithVenue:@"Test" imagePath:@"Test" section:@"Test" row:@"Test" seat:@"Test" views:@"Test" note:@"Test"];
    NSLog(@"%@", fp);
    
    NSDictionary *json = @{@"venue" : @"Test", @"image" : @"Test", @"section" : @"Test", @"row" : @"Test", @"seat" : @"Test", @"views" : @"Test", @"note" : @"Test"};
    FeaturedPhoto *fp2 = [[FeaturedPhoto alloc] initWithJSON:json];
    NSLog(@"%@", fp2);
}

@end
