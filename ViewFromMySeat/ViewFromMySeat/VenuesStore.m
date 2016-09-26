//
//  VenuesStore.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "VenuesStore.h"
#import "ViewFromMySeatAPI.h"
#import "ImageStore.h"

@interface VenuesStore()

@property (nonatomic) ImageStore * imageStore;

@end

@implementation VenuesStore

#pragma mark - Inits

- (instancetype)init {
    self = [super init];
    if (self) {
        _imageStore = [ImageStore new];
    }
    return self;
}

#pragma mark - Data Fetchers

- (void)fetchVenueWithName:(NSString *)venueName withCompletion:(void(^)(Venue * venue, NSError * error))completion {
    NSURL * url = [ViewFromMySeatAPI venueDetailsURLWithVenue:venueName];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [self makeRequest:request withCompletion:^(NSData * data, NSError * error) {
        if (data) {
            NSError * jsonError;
            Venue * venue = [ViewFromMySeatAPI venueFromJSONData:data error:&jsonError];
            
            if (!jsonError) {
                completion(venue, nil);
            } else {
                completion(nil, jsonError);
            }
        } else {
            completion(nil, error);
        }
    }];
}

- (void)fetchVenueImageForVenue:(Venue *)venue withCompletion:(void(^)(UIImage * image, NSError * error))completion; {
    UIImage * cachedImage = [_imageStore imageForKey:venue.venueID];
    if (cachedImage) {
        venue.image = cachedImage;
        completion(cachedImage, nil);
        return;
    }
    
    NSURL * url = [ViewFromMySeatAPI venueDetailsImageURLWithImageName:venue.imagePath];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [self makeRequest:request withCompletion:^(NSData * data, NSError * error) {
        if (data) {
            UIImage * image = [UIImage imageWithData:data];
            venue.image = image;
            [_imageStore cacheImage:image forKey:venue.venueID];
            completion(image, nil);
        } else {
            completion(nil, error);
        }
    }];
}

@end
