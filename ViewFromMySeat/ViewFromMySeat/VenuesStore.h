//
//  VenuesStore.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseRequest.h"
#import "Venue.h"

@interface VenuesStore : BaseRequest

- (void)fetchVenueWithName:(NSString *)venueName withCompletion:(void(^)(Venue * venue, NSError * error))completion;
- (void)fetchVenueImageWithPath:(NSString *)imagePath withCompletion:(void(^)(UIImage * image, NSError * error))completion;

@end
