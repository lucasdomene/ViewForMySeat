//
//  ViewForMySeatAPI.m
//  ViewForMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "ViewForMySeatAPI.h"

@implementation ViewForMySeatAPI

#pragma mark - Attributes

static NSString * const appKey = @"f6bcd8e8bb853890f4fb2be8ce0418fa";
static NSString * const baseURLString = @"https://aviewfrommyseat.com/";
static NSString * const featuredPhotosPath = @"avf/api/featured.php";
static NSString * const featuredPhotosImagePath = @"wallpaper";
static NSString * const venueDetailsPath = @"avf/api/venue.php";
static NSString * const venueDetailsImagePath = @"photos";


#pragma mark - Static Functions

+ (NSURL *)viewForMySeatURLWithPath:(NSString *)path andParameters:(NSDictionary *)parameters {
    NSURLComponents * components = [[NSURLComponents alloc] initWithString: [baseURLString stringByAppendingPathComponent:path]];
    NSMutableArray * queryItems = [[NSMutableArray alloc] init];
    NSDictionary * baseParameters = @{ @"appkey" : appKey };
    
    for (NSString * key in baseParameters) {
        NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:key value: baseParameters[key]];
        [queryItems addObject:queryItem];
    }
    
    for (NSString * key in parameters) {
        NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:key value: parameters[key]];
        [queryItems addObject:queryItem];
    }
    
    components.queryItems = queryItems;
    return components.URL;
}

+ (NSURL *)featuredPhotosURLWithPage:(NSString *)page {
    return [self viewForMySeatURLWithPath:featuredPhotosPath andParameters: @{ @"page" : page, @"total" : @"20" }];
}

+ (NSURL *)venueDetailsURLWithVenue:(NSString *)venueName {
    return [self viewForMySeatURLWithPath:venueDetailsPath andParameters:@{ @"venue" : venueName, @"info": @"true" }];
}

+ (NSURL *)featuredPhotoImageURLWithImageName:(NSString *)imageName {
    return [self viewForMySeatURLWithPath:[featuredPhotosImagePath stringByAppendingPathComponent:imageName] andParameters:nil];
}

+ (NSURL *)venueDetailsImageURLWithImageName:(NSString *)imageName {
    return [self viewForMySeatURLWithPath:[venueDetailsImagePath stringByAppendingPathComponent:imageName] andParameters:nil];
}

@end
