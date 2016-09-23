//
//  VenuesStore.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Venue.h"

@interface VenuesStore : NSObject

- (void)fetchVenueWithName:(NSString *)venueName withCompletion:(void(^)(Venue *))completion;
- (void)fetchVenueImageWithPath:(NSString *)imagePath withCompletion:(void(^)(UIImage *))completion;

@end
