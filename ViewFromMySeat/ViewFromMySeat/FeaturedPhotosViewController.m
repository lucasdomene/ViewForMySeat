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
#import "FeaturedPhotoTableViewCell.h"
#import "VenueViewController.h"
#import "UIAlertController+CustomAlerts.h"

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
    
    [self setEstimateRowHeight];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRotate) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    [self fetchFeaturedPhotosWithCompletion:nil];
    [self createPullToRefresh];
}

- (void)fetchFeaturedPhotosWithCompletion:(void(^)())completion {
    [_featuredPhotoStore fetchFeaturedPhotosInPage:@(pageNumber).stringValue withCompletion:^(NSArray *featuredPhotos, NSError *error) {
        if (error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                UIAlertController * alertController = [[UIAlertController alloc] initWithError:error andRetryBlock:^{
                    [self fetchFeaturedPhotosWithCompletion:nil];
                }];
                [self presentViewController:alertController animated:true completion:nil];
            }];
        } else if (featuredPhotos && featuredPhotos.count > 0) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.featuredPhotosDataSource.featuredPhotos addObjectsFromArray:featuredPhotos];
                [self.tableView reloadData];
            }];
        } else {
            isLastPage = TRUE;
        }
        if (completion) {
            completion();
        }
    }];
}

- (void)loadNextPage {
    if (!isLastPage) {
        pageNumber++;
        [self fetchFeaturedPhotosWithCompletion:nil];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _featuredPhotosDataSource.featuredPhotos.count - 5) {
        [self loadNextPage];
    }
    
    FeaturedPhoto * featuredPhoto = _featuredPhotosDataSource.featuredPhotos[indexPath.row];
    [_featuredPhotoStore fetchImageForFeaturedPhoto:featuredPhoto withCompletion:^(UIImage *image, NSError *error) {
        if (error) {
            NSLog(@"Error fetching image");
        } else if (image) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                FeaturedPhotoTableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
                [cell updateWithImage:image];
            }];
        }
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    FeaturedPhoto * featuredPhoto = _featuredPhotosDataSource.featuredPhotos[indexPath.row];
    [self performSegueWithIdentifier:@"showVenueDetails" sender:featuredPhoto];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showVenueDetails"]) {
        VenueViewController * venueViewController = (VenueViewController *)segue.destinationViewController;
        venueViewController.venuesStore  = _venuesStore;
        venueViewController.featuredPhoto = (FeaturedPhoto *)sender;;
    }
}

- (void)didRotate {
    [self setEstimateRowHeight];
    [self.tableView reloadData];
}

- (void)setEstimateRowHeight {
    self.tableView.estimatedRowHeight = self.view.frame.size.width * 0.6;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)createPullToRefresh {
    UIRefreshControl * refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshFeaturedPhotos:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

- (void)refreshFeaturedPhotos:(UIRefreshControl *)sender {
    isLastPage = NO;
    pageNumber = 1;
    [_featuredPhotosDataSource.featuredPhotos removeAllObjects];
    [self fetchFeaturedPhotosWithCompletion:^{
        [sender endRefreshing];
    }];
}


@end
