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

int pageNumber = 1;
BOOL isLastPage = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FeaturedPhotoTableViewCell" bundle:nil] forCellReuseIdentifier:@"FeaturedPhotoCell"];
    
    _featuredPhotosDataSource = [FeaturedPhotosDataSource new];
    self.tableView.dataSource = _featuredPhotosDataSource;
    self.tableView.delegate = self;
    
    [self fetchFeaturedPhotos];
}

- (void)fetchFeaturedPhotos {
    [_featuredPhotoStore fetchFeaturedPhotosInPage:@(pageNumber).stringValue withCompletion:^(NSArray *featuredPhotos, NSError *error) {
        if (featuredPhotos) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.featuredPhotosDataSource.featuredPhotos addObjectsFromArray:featuredPhotos];
                [self.tableView reloadData];
            }];
        }
    }];
}

- (void)loadNextPage {
    if (!isLastPage) {
        pageNumber++;
        [self fetchFeaturedPhotos];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _featuredPhotosDataSource.featuredPhotos.count - 5) {
        [self loadNextPage];
    }
}


@end
