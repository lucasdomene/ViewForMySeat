//
//  VenueDataSource.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/25/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenueDataSource : NSObject <UITableViewDataSource>

@property (nonatomic) NSMutableArray *venueDetails;

- (instancetype)initWithVenueDetails:(NSMutableArray *)venueDetails;

@end
