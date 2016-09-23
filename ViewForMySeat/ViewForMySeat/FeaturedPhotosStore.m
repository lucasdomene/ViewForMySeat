//
//  FeaturedPhotosStore.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhotosStore.h"
#import "ViewFromMySeatAPI.h"

@interface FeaturedPhotosStore()

@property (nonatomic) NSURLSession *session;

@end

@implementation FeaturedPhotosStore

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (void)fetchFeaturedPhotosInPage:(NSString *)page withCompletion:(void(^)(NSArray *))completion {
    NSURL * url = [ViewFromMySeatAPI featuredPhotosURLWithPage:page];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (data) {
            NSArray * featuredPhotos = [ViewFromMySeatAPI featuredPhotosFromJSONData:data];
            completion(featuredPhotos);
        } else {
            completion(nil);
        }
    }] resume];
}

- (void)fetchImageForFeaturedPhoto:(FeaturedPhoto *)featuredPhoto withCompletion:(void(^)(UIImage *))completion {
    NSURL * url = [ViewFromMySeatAPI featuredPhotoImageURLWithImageName:featuredPhoto.imagePath];
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

