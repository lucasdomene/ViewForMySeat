//
//  FeaturedPhotosStore.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhotosStore.h"
#import "ViewFromMySeatAPI.h"

@implementation FeaturedPhotosStore

- (void)fetchFeaturedPhotosInPage:(NSString *)page withCompletion:(void(^)(NSArray *))completion {
    NSURL * url = [ViewFromMySeatAPI featuredPhotosURLWithPage:page];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [self makeRequest:request withCompletion:^(NSData * data, NSError * error) {
        if (data) {
            NSArray * featuredPhotos = [ViewFromMySeatAPI featuredPhotosFromJSONData:data];
            completion(featuredPhotos);
        } else {
            //treat error or pass it
            completion(nil);
        }
    }];
}

- (void)fetchImageForFeaturedPhoto:(FeaturedPhoto *)featuredPhoto withCompletion:(void(^)(UIImage *))completion {
    NSURL * url = [ViewFromMySeatAPI featuredPhotoImageURLWithImageName:featuredPhoto.imagePath];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [self makeRequest:request withCompletion:^(NSData * data, NSError * error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image);
        } else {
            //treat error or pass it
            completion(nil);
        }
    }];
}


@end


