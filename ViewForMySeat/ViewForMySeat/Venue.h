//
//  Venue.h
//  ViewForMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Venue : NSObject

@property (nonatomic, readonly, copy) NSString * name;
@property (nonatomic, readonly, copy) NSString * imagePath;
@property (nonatomic, readonly, copy) NSString * address;
@property (nonatomic, readonly, copy) NSString * city;
@property (nonatomic, readonly, copy) NSString * state;
@property (nonatomic, readonly, copy) NSString * country;
@property (nonatomic, readonly, copy) NSString * averageRating;
@property (nonatomic, readonly, copy) NSString * stats;
@property (nonatomic, readonly, copy) NSString * link;

- (instancetype)initWithName:(NSString *)name
                   imagePath:(NSString *)imagePath
                     address:(NSString *)address
                        city:(NSString *)city
                       state:(NSString *)state
                     country:(NSString *)country
               averageRating:(NSString *)averageRating
                       stats:(NSString *)stats
                        link:(NSString *)link;

- (instancetype)initWithJSON:(NSDictionary *)json;

@end
