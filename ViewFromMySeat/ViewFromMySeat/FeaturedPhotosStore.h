//
//  FeaturedPhotosStore.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseRequest.h"
#import "FeaturedPhoto.h"

@interface FeaturedPhotosStore : BaseRequest

- (void)fetchFeaturedPhotosInPage:(NSString *)page withCompletion:(void(^)(NSArray * featuredPhotos, NSError * error))completion;
- (void)fetchImageForFeaturedPhoto:(FeaturedPhoto *)featuredPhoto withCompletion:(void(^)(UIImage * image, NSError * error))completion;
- (void)cleanCache;

@end
