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
#import "FeaturedPhotosDataSource.h"

@interface FeaturedPhotosViewController()

@property (nonatomic) FeaturedPhotosDataSource * featuredPhotosDataSource;

@end

@implementation FeaturedPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FeaturedPhotoTableViewCell" bundle:nil] forCellReuseIdentifier:@"FeaturedPhotoCell"];
    
    _featuredPhotosDataSource = [FeaturedPhotosDataSource new];
    self.tableView.dataSource = _featuredPhotosDataSource;
    
    [_featuredPhotoStore fetchFeaturedPhotosInPage:@"1" withCompletion:^(NSArray *featuredPhotos, NSError *error) {
        if (featuredPhotos) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.featuredPhotosDataSource.featuredPhotos = featuredPhotos;
                [self.tableView reloadData];
            }];
        }
    }];
}


@end
