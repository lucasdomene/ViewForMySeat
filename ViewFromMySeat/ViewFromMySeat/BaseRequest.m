//
//  BaseRequest.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "BaseRequest.h"

@interface BaseRequest()

@property (nonatomic) NSURLSession *session;

@end

@implementation BaseRequest

#pragma mark - Inits

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

#pragma mark - Data Fetchers

- (void)makeRequest:(NSURLRequest *)request withCompletion:(void(^)(NSData * data, NSError * error))completion {
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        completion(data, error);
    }] resume];
}

@end
