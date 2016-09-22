//
//  ViewForMySeatAPI.h
//  ViewForMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewForMySeatAPI : NSObject

+ (NSURL *)viewForMySeatURLWithPath:(NSString *)path andParameters:(NSDictionary *)parameters;
+ (NSURL *)featuredPhotosURLWithPage:(NSString *)page;
+ (NSURL *)venueDetailsURLWithVenue:(NSString *)venueName;
+ (NSURL *)featuredPhotoImageURLWithImageName:(NSString *)imageName;
+ (NSURL *)venueDetailsImageURLWithImageName:(NSString *)imageName;

@end
