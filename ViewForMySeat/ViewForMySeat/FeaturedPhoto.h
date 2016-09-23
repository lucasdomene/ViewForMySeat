//
//  FeaturedPhoto.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeaturedPhoto : NSObject

@property (nonatomic, readonly, copy) NSString * venue;
@property (nonatomic, readonly, copy) NSString * imagePath;
@property (nonatomic, readonly, copy) NSString * section;
@property (nonatomic, readonly, copy) NSString * row;
@property (nonatomic, readonly, copy) NSString * seat;
@property (nonatomic, readonly, copy) NSString * views;
@property (nonatomic, readonly, copy) NSString * note;

- (instancetype)initWithVenue:(NSString *)venue
                    imagePath:(NSString *)imagePath
                      section:(NSString *)section
                          row:(NSString *)row
                         seat:(NSString *)seat
                        views:(NSString *)views
                         note:(NSString *)note;

- (instancetype)initWithJSON:(NSDictionary *)json;

@end
