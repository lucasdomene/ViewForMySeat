//
//  FeaturedPhoto.m
//  ViewForMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhoto.h"

@implementation FeaturedPhoto

- (instancetype)initWithVenue:(NSString *)venue
                    imagePath:(NSString *)imagePath
                      section:(NSString *)section
                          row:(NSString *)row
                         seat:(NSString *)seat
                        views:(NSString *)views
                         note:(NSString *)note {
    self = [super init];
    if (self) {
        _venue = [venue copy];
        _imagePath = [imagePath copy];
        _section = [section copy];
        _row = [row copy];
        _seat = [seat copy];
        _views = [views copy];
        _note = [note copy];
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithVenue:nil imagePath:nil section:nil row:nil seat:nil views:nil note:nil];
}

- (instancetype)initWithJSON:(NSDictionary *)json {
    NSString * venue = json[@"venue"];
    NSString * imagePath = json[@"image"];
    NSString * section = json[@"section"];
    NSString * row = json[@"row"];
    NSString * seat = json[@"seat"];
    NSString * views = json[@"views"];
    NSString * note = json[@"note"];
    
    return [self initWithVenue:venue imagePath:imagePath section:section row:row seat:seat views:views note:note];
}

@end
