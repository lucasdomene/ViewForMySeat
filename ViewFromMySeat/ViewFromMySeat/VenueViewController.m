//
//  VenueViewController.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "VenueViewController.h"
#import "VenueDataSource.h"

@interface VenueViewController ()

@property (nonatomic) VenueDataSource * venueDataSource;

@end

@implementation VenueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FeaturedPhotoTableViewCell" bundle:nil] forCellReuseIdentifier:@"FeaturedPhotoCell"];
    
    self.title = _featuredPhoto.venue;
    
    _venueDataSource = [VenueDataSource new];
    self.tableView.dataSource = _venueDataSource;
    [_venueDataSource.venueDetails addObject:_featuredPhoto];
    
    [self setEstimateRowHeight];
}

- (void)setEstimateRowHeight {
    self.tableView.estimatedRowHeight = self.view.frame.size.width * 0.6;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

@end
