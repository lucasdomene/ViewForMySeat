//
//  ViewFromMySeatAPI.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "ViewFromMySeatAPI.h"

@implementation ViewFromMySeatAPI

#pragma mark - Attributes

static NSString * const appKey = @"f6bcd8e8bb853890f4fb2be8ce0418fa";
static NSString * const baseURLString = @"https://aviewfrommyseat.com/";
static NSString * const featuredPhotosPath = @"avf/api/featured.php";
static NSString * const featuredPhotosImagePath = @"wallpaper";
static NSString * const venueDetailsPath = @"avf/api/venue.php";
static NSString * const venueDetailsImagePath = @"photos";


#pragma mark - Static Functions

+ (NSURL *)viewFromMySeatURLWithPath:(NSString *)path andParameters:(NSDictionary *)parameters {
    NSURLComponents * components = [[NSURLComponents alloc] initWithString: [baseURLString stringByAppendingPathComponent:path]];
    NSMutableArray * queryItems = [[NSMutableArray alloc] init];
    NSMutableDictionary * baseParameters = [@{ @"appkey" : appKey } mutableCopy];
    [baseParameters addEntriesFromDictionary:parameters];
    
    for (NSString * key in baseParameters) {
        NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:key value:baseParameters[key]];
        [queryItems addObject:queryItem];
    }
    
    components.queryItems = queryItems;
    return components.URL;
}

+ (NSURL *)featuredPhotosURLWithPage:(NSString *)page {
    return [self viewFromMySeatURLWithPath:featuredPhotosPath andParameters: @{ @"page" : page }];
}

+ (NSURL *)venueDetailsURLWithVenue:(NSString *)venueName {
    return [self viewFromMySeatURLWithPath:venueDetailsPath andParameters:@{ @"venue" : venueName, @"info": @"true" }];
}

+ (NSURL *)featuredPhotoImageURLWithImageName:(NSString *)imageName {
    return [self viewFromMySeatURLWithPath:[featuredPhotosImagePath stringByAppendingPathComponent:imageName] andParameters:nil];
}

+ (NSURL *)venueDetailsImageURLWithImageName:(NSString *)imageName {
    return [self viewFromMySeatURLWithPath:[venueDetailsImagePath stringByAppendingPathComponent:imageName] andParameters:nil];
}

+ (NSArray *)featuredPhotosFromJSONData:(NSData *)data error:(NSError **)error {
    NSError * jsonError;
    NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    
    if (!jsonError) {
        NSMutableArray * featuredPhotos = [[NSMutableArray alloc] init];
        NSArray * featuredPhotosArray = responseObject[@"avfms"];
        
        for (NSDictionary * featuredPhotoDictionary in featuredPhotosArray) {
            FeaturedPhoto * featuredPhoto = [[FeaturedPhoto alloc] initWithJSON:featuredPhotoDictionary];
            [featuredPhotos addObject:featuredPhoto];
        }
        
        return featuredPhotos;
    } else {
        *error = jsonError;
        return nil;
    }
}

+ (Venue *)venueFromJSONData:(NSData *)data error:(NSError **)error {
    NSError * jsonError;
    NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    
    if (!jsonError) {
        NSArray * venuesArray = responseObject[@"avfms"];
        NSDictionary * venueDictionary = venuesArray.firstObject;
        return [[Venue alloc] initWithJSON:venueDictionary];
    } else {
        *error = jsonError;
        return nil;
    }
}


@end
