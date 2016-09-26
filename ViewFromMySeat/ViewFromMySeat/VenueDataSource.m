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
#import "VenueStatsTableViewCell.h"
#import "MapTableViewCell.h"

enum VenueSections {
    FeaturedPhotoSection = 0,
    VenueLocationSection = 1,
    VenueStatsSection = 2
};

@implementation VenueDataSource

#pragma mark - Inits

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

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_venueDetails.count == 2) {
        Venue * venue = _venueDetails[1];
        return [venue hasStats] ? 3 : 2;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == VenueLocationSection) {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case FeaturedPhotoSection:
            return [self featuredPhotoCellWithTableView:tableView atIndexPath:indexPath];
            break;
        case VenueLocationSection:{
            if (indexPath.row == 0) {
                return [self venueLocationCellWithTableView:tableView atIndexPath:indexPath];
            } else {
                return [self venueMapCellWithTableView:tableView atIndexPath:indexPath];
            }
            break;
        }
        case VenueStatsSection:
            return [self venueStatsCellWithTableView:tableView atIndexPath:indexPath];
            break;
        default:
            break;
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case VenueLocationSection:
            return @"Location";
            break;
        case VenueStatsSection:
            return @"Stats";
            break;
        default:
            break;
    }
    return nil;
}

#pragma mark - Cells creation

- (FeaturedPhotoTableViewCell *)featuredPhotoCellWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    FeaturedPhotoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FeaturedPhotoCell" forIndexPath:indexPath];
    FeaturedPhoto * featuredPhoto = _venueDetails[0];
    NSString * seatInfo = [NSString stringWithFormat:@"Section: %@, row: %@, seat: %@", featuredPhoto.section, featuredPhoto.row, featuredPhoto.seat];
    
    cell.venueNameLabel.text = featuredPhoto.venue;
    cell.seatLabel.text = seatInfo;
    cell.numberOfViewsLabel.text = featuredPhoto.views;
    cell.notesLabel.text = featuredPhoto.note;
    cell.zoomImage.hidden = NO;
    
    if (_venueDetails.count == 2) {
        Venue * venue = _venueDetails[1];
        [cell updateWithImage:venue.image];
    }
    
    return cell;
}

- (VenueLocationTableViewCell *)venueLocationCellWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    VenueLocationTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"VenueLocationCell" forIndexPath:indexPath];
    Venue * venue = _venueDetails[1];
    NSString * cityAndState = [NSString stringWithFormat:@"%@ - %@", venue.city, venue.state];
    
    cell.addressLabel.text = venue.address;
    cell.cityAndStateLabel.text = cityAndState;
    cell.countryLabel.text = venue.country;
    cell.ratingLabel.text = venue.averageRating;
    
    return cell;
}

- (VenueStatsTableViewCell *)venueStatsCellWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    VenueStatsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"VenueStatsCell" forIndexPath:indexPath];
    Venue * venue = _venueDetails[1];
    
    NSData * stringData = [venue.stats dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * options = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType};
    NSAttributedString * decodedString = [[NSAttributedString alloc] initWithData:stringData
                                                                          options:options
                                                               documentAttributes:NULL
                                                                            error:NULL];
    NSString *trimmedString = [decodedString.string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    cell.statsLabel.text = trimmedString;
    
    return cell;
}

- (MapTableViewCell *)venueMapCellWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    MapTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MapCell"];
    Venue * venue = _venueDetails[1];
    
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder geocodeAddressString:venue.address completionHandler:^(NSArray<CLPlacemark *> * placemarks, NSError * error) {
        if (placemarks.count > 0 && placemarks.firstObject.location) {
            MKPointAnnotation * pin = [[MKPointAnnotation alloc] init];
            pin.coordinate = placemarks.firstObject.location.coordinate;
            [cell.mapView showAnnotations:@[pin] animated:YES];
        }
    }];
    
    return cell;
}

@end
