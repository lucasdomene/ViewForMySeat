//
//  VenueDataSource.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/25/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VenueDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, copy) NSMutableArray *venueDetails;

- (instancetype)initWithVenueDetails:(NSMutableArray *)venueDetails;

@end
