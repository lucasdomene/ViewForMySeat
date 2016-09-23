//
//  VenuesStore.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "VenuesStore.h"
#import "ViewFromMySeatAPI.h"

@interface VenuesStore()

@property (nonatomic) NSURLSession *session;

@end

@implementation VenuesStore

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (void)fetchVenueWithName:(NSString *)venueName withCompletion:(void(^)(Venue *))completion {
    NSURL * url = [ViewFromMySeatAPI venueDetailsURLWithVenue:venueName];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (data) {
            Venue * venue = [ViewFromMySeatAPI venueFromJSONData:data];
            completion(venue);
        } else {
            completion(nil);
        }
    }] resume];
}

- (void)fetchVenueImageWithPath:(NSString *)imagePath withCompletion:(void(^)(UIImage *))completion {
    NSURL * url = [ViewFromMySeatAPI venueDetailsImageURLWithImageName:imagePath];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image);
        } else {
            completion(nil);
        }
    }] resume];
}

@end
