//
//  FeaturedPhoto.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhoto.h"

@implementation FeaturedPhoto

- (instancetype)initWithFeaturedPhotoID:(NSString *)featuredPhotoID
                              venueName:(NSString *)venueName
                              imagePath:(NSString *)imagePath
                                section:(NSString *)section
                                    row:(NSString *)row
                                   seat:(NSString *)seat
                                  views:(NSString *)views
                                   note:(NSString *)note {
    self = [super init];
    if (self) {
        _featuredPhotoID = [featuredPhotoID copy];
        _venue = [venueName copy];
        _imagePath = [imagePath copy];
        _section = [section copy];
        _row = [row copy];
        _seat = [seat copy];
        _views = [views copy];
        _note = [note copy];
    }
    
    return self;
}

- (instancetype)initWithJSON:(NSDictionary *)json {
    NSString * featuredPhotoID = json[@"index"];
    NSString * venueName = json[@"venue"];
    NSString * imagePath = json[@"image"];
    NSString * section = json[@"section"];
    NSString * row = json[@"row"];
    NSString * seat = json[@"seat"];
    NSString * views = json[@"views"];
    NSString * note = json[@"note"];
    
    return [self initWithFeaturedPhotoID:featuredPhotoID venueName:venueName imagePath:imagePath section:section row:row seat:seat views:views note:note];
}

@end
