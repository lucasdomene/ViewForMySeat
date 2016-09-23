//
//  FeaturedPhotosStore.h
//  ViewForMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FeaturedPhoto.h"

@interface FeaturedPhotosStore : NSObject

- (void)fetchFeaturedPhotosInPage:(NSString *)page withCompletion:(void(^)(NSArray *))completion;
- (void)fetchImageForFeaturedPhoto:(FeaturedPhoto *)featuredPhoto withCompletion:(void(^)(UIImage *))completion;

@end
