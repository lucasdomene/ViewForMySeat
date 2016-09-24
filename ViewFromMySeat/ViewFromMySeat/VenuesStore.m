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

- (instancetype)init {
    self = [super init];
    if (self) {
        _imageStore = [ImageStore new];
    }
    return self;
}

- (void)fetchVenueWithName:(NSString *)venueName withCompletion:(void(^)(Venue * venue, NSError * error))completion {
    NSURL * url = [ViewFromMySeatAPI venueDetailsURLWithVenue:venueName];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [self makeRequest:request withCompletion:^(NSData * data, NSError * error) {
        if (data) {
            Venue * venue = [ViewFromMySeatAPI venueFromJSONData:data];
            completion(venue, nil);
        } else {
            // Throw the error
            completion(nil, error);
        }
    }];
}

- (void)fetchVenueImageForVenue:(Venue *)venue withCompletion:(void(^)(UIImage * image, NSError * error))completion; {
    UIImage * cachedImage = [_imageStore imageForKey:venue.venueID];
    if (cachedImage) {
        completion(cachedImage, nil);
        return;
    }
    
    NSURL * url = [ViewFromMySeatAPI venueDetailsImageURLWithImageName:venue.imagePath];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [self makeRequest:request withCompletion:^(NSData * data, NSError * error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            [_imageStore cacheImage:image forKey:venue.venueID];
            completion(image, nil);
        } else {
            completion(nil, error);
        }
    }];
}

@end
