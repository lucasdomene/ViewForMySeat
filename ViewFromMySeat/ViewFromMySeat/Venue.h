//
//  Venue.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Venue : NSObject

@property (nonatomic, readonly, copy) NSString * venueID;
@property (nonatomic, readonly, copy) NSString * name;
@property (nonatomic, readonly, copy) NSString * imagePath;
@property (nonatomic, readonly, copy) NSString * address;
@property (nonatomic, readonly, copy) NSString * city;
@property (nonatomic, readonly, copy) NSString * state;
@property (nonatomic, readonly, copy) NSString * country;
@property (nonatomic, readonly, copy) NSString * averageRating;
@property (nonatomic, readonly, copy) NSString * stats;
@property (nonatomic) UIImage * image;

- (instancetype)initWithVenueID:(NSString *)venueID
                           name:(NSString *)name
                      imagePath:(NSString *)imagePath
                        address:(NSString *)address
                           city:(NSString *)city
                          state:(NSString *)state
                        country:(NSString *)country
                  averageRating:(NSString *)averageRating
                          stats:(NSString *)stats;

- (instancetype)initWithJSON:(NSDictionary *)json;
- (BOOL)hasStats;

@end
