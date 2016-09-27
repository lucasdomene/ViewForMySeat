//
//  ViewForMySeatAPI.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhoto.h"
#import "Venue.h"

@interface ViewFromMySeatAPI : NSObject

+ (NSURL *)viewFromMySeatURLWithPath:(NSString *)path andParameters:(NSDictionary *)parameters;
+ (NSURL *)featuredPhotosURLWithPage:(NSString *)page;
+ (NSURL *)venueDetailsURLWithVenue:(NSString *)venueName;
+ (NSURL *)featuredPhotoImageURLWithImageName:(NSString *)imageName;
+ (NSURL *)venueDetailsImageURLWithImageName:(NSString *)imageName;
+ (NSArray *)featuredPhotosFromJSONData:(NSData *)data error:(NSError **)error;
+ (Venue *)venueFromJSONData:(NSData *)data error:(NSError **)error;

@end
