//
//  FeaturedPhotosDataSource.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhotosDataSource.h"
#import "FeaturedPhotoTableViewCell.h"
#import "FeaturedPhoto.h"

@implementation FeaturedPhotosDataSource

- (instancetype)initWithFeaturedPhotos:(NSMutableArray *)featuredPhotos {
    self = [super init];
    if (self) {
        _featuredPhotos = featuredPhotos;
    }
    return self;
}

- (instancetype)init {
    return [self initWithFeaturedPhotos:[NSMutableArray new]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _featuredPhotos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedPhotoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FeaturedPhotoCell" forIndexPath:indexPath];
    FeaturedPhoto * featuredPhoto = _featuredPhotos[indexPath.row];
    
    cell.venueNameLabel.text = featuredPhoto.venue;
    
    NSString * seatInfo = [NSString stringWithFormat:@"Section: %@, row: %@, seat: %@", featuredPhoto.section, featuredPhoto.row, featuredPhoto.seat];
    
    cell.seatLabel.text = seatInfo;
    cell.numberOfViewsLabel.text = featuredPhoto.views;
    cell.notesLabel.text = featuredPhoto.note;
    
    return cell;
}

@end
