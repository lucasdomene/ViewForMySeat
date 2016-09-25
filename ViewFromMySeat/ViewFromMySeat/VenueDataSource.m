//
//  VenueDataSource.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/25/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "VenueDataSource.h"
#import "Venue.h"
#import "FeaturedPhoto.h"
#import "VenueLocationTableViewCell.h"
#import "FeaturedPhotoTableViewCell.h"

//#define featuredPhotoRow 0
//#define venueLocationRow 1
//#define venueStatsRow 2

enum VenueRows {
    FeaturedPhotoRow = 0,
    VenueLocationRow = 1,
    VenueStatsRow = 2
};

@implementation VenueDataSource

- (instancetype)initWithVenueDetails:(NSMutableArray *)venueDetails {
    self = [super init];
    if (self) {
        _venueDetails = venueDetails;
    }
    return self;
}

- (instancetype)init {
    return [self initWithVenueDetails:[NSMutableArray new]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_venueDetails.count == 2) {
        Venue * venue = _venueDetails[1];
        return [venue hasStats] ? 3 : 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case FeaturedPhotoRow:
            return [self featuredPhotoCellWithTableView:tableView atIndexPath:indexPath];
            break;
        case VenueLocationRow:
            return [UITableViewCell new];
            break;
        case VenueStatsRow:
            return [UITableViewCell new];
            break;
        default:
            break;
    }
    return nil;
}

- (FeaturedPhotoTableViewCell *)featuredPhotoCellWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    FeaturedPhotoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FeaturedPhotoCell" forIndexPath:indexPath];
    FeaturedPhoto * featuredPhoto = _venueDetails[0];
    NSString * seatInfo = [NSString stringWithFormat:@"Section: %@, row: %@, seat: %@", featuredPhoto.section, featuredPhoto.row, featuredPhoto.seat];
    
    cell.venueNameLabel.text = featuredPhoto.venue;
    cell.seatLabel.text = seatInfo;
    cell.numberOfViewsLabel.text = featuredPhoto.views;
    cell.notesLabel.text = featuredPhoto.note;
    [cell updateWithImage:featuredPhoto.image];
    
    return cell;
}

@end
