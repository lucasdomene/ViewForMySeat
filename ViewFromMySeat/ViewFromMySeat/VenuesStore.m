//
//  VenuesStore.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "VenuesStore.h"
#import "ViewFromMySeatAPI.h"

@implementation VenuesStore

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

- (void)fetchVenueImageWithPath:(NSString *)imagePath withCompletion:(void(^)(UIImage * image, NSError * error))completion {
    NSURL * url = [ViewFromMySeatAPI venueDetailsImageURLWithImageName:imagePath];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [self makeRequest:request withCompletion:^(NSData * data, NSError * error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image, nil);
        } else {
            completion(nil, error);
        }
    }];
}

@end
