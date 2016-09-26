//
//  VenueViewController.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "VenueViewController.h"
#import "VenueDataSource.h"
#import "AppDelegate.h"

@interface VenueViewController ()

@property (nonatomic) VenueDataSource * venueDataSource;
@property (nonatomic) UIActivityIndicatorView * spinner;

@end

@implementation VenueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCells];
    [self setHeaderViewAppearence];
    
    self.title = _featuredPhoto.venue;
    
    _venueDataSource = [VenueDataSource new];
    self.tableView.dataSource = _venueDataSource;
    [_venueDataSource.venueDetails addObject:_featuredPhoto];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareVenue)];
    
    [self setEstimateRowHeight];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRotate) name:UIDeviceOrientationDidChangeNotification object:nil];
    [self configureSpinner];
    [self fetchVenue];
}

- (void)fetchVenue {
    [_spinner startAnimating];
    [_venuesStore fetchVenueWithName:_featuredPhoto.venue withCompletion:^(Venue *venue, NSError *error) {
        //Treat Error
        if (venue) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.venueDataSource.venueDetails addObject:venue];
                [self.tableView reloadData];
            }];
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [_spinner stopAnimating];
        }];
    }];
}

- (void)didRotate {
    [self setEstimateRowHeight];
    [self.tableView reloadData];
}

- (void)setEstimateRowHeight {
    self.tableView.estimatedRowHeight = self.view.frame.size.width * 0.6;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)setHeaderViewAppearence {
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UITableViewHeaderFooterView class]]] setFont:[UIFont fontWithName:@"Avenir-Heavy" size:17]];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UITableViewHeaderFooterView class]]] setTextColor:[UIColor colorWithRed:97.0/255.0 green:201.0/255.0 blue:172.0/255.0 alpha:1.0]];
    [[UIView appearanceWhenContainedInInstancesOfClasses:@[[UITableViewHeaderFooterView class]]] setBackgroundColor:[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0]];
}

- (void)registerCells {
    [self.tableView registerNib:[UINib nibWithNibName:@"FeaturedPhotoTableViewCell" bundle:nil] forCellReuseIdentifier:@"FeaturedPhotoCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"VenueLocationTableViewCell" bundle:nil] forCellReuseIdentifier:@"VenueLocationCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"VenueStatsTableViewCell" bundle:nil] forCellReuseIdentifier:@"VenueStatsCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MapTableViewCell" bundle:nil] forCellReuseIdentifier:@"MapCell"];
}

- (void)configureSpinner {
    _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _spinner.center = self.view.center;
    _spinner.color = [UIColor colorWithRed:97.0/255.0 green:201.0/255.0 blue:172.0/255.0 alpha:1.0];
    _spinner.hidesWhenStopped = YES;
    [self.view addSubview:_spinner];
}

- (void)shareVenue {
    NSString * textToShare = [NSString stringWithFormat:@"This seat in %@ is amazing!", _featuredPhoto.venue];
    UIActivityViewController * activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[textToShare, _featuredPhoto.image] applicationActivities:nil];
    activityViewController.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    [self presentViewController:activityViewController animated:true completion:nil];
}


@end
