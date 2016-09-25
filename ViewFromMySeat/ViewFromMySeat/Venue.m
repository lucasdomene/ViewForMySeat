//
//  Venue.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "Venue.h"

@implementation Venue

- (instancetype)initWithVenueID:(NSString *)venueID
                           name:(NSString *)name
                      imagePath:(NSString *)imagePath
                        address:(NSString *)address
                           city:(NSString *)city
                          state:(NSString *)state
                        country:(NSString *)country
                  averageRating:(NSString *)averageRating
                          stats:(NSString *)stats
                           link:(NSString *)link {
    self = [super init];
    if (self) {
        _venueID = [_venueID copy];
        _name = [name copy];
        _imagePath = [imagePath copy];
        _address = [address copy];
        _city = [city copy];
        _state = [state copy];
        _country = [country copy];
        _averageRating = [averageRating copy];
        _stats = [stats copy];
        _link = [link copy];
    }
    
    return self;
}

- (instancetype)initWithJSON:(NSDictionary *)json {
    NSString * venueID = json[@"id"];
    NSString * name = json[@"name"];
    NSString * imagePath = json[@"newest_image"];
    NSString * address = json[@"address"];
    NSString * city = json[@"city"];
    NSString * state = json[@"state"];
    NSString * country = json[@"country"];
    NSString * averageRating = json[@"average_rating"];
    NSString * stats = json[@"stats"];
    NSString * link = json[@"link"]; 
    
    return [self initWithVenueID:venueID name:name imagePath:imagePath address:address city:city state:state country:country averageRating:averageRating stats:stats link:link];
}

- (BOOL)hasStats {
    return self.stats ? YES : NO;
}

@end
