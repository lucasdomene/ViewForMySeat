//
//  ImageStore.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "ImageStore.h"

static ImageStore *sharedInstance;

@interface ImageStore()

@property (nonatomic) NSCache *imageCache;

@end

@implementation ImageStore

+ (ImageStore *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ImageStore alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.imageCache = [[NSCache alloc] init];
    }
    return self;
}


- (void)cacheImage:(UIImage *)image forKey:(NSString *)key {
    [self.imageCache setObject:image forKey:key];
}

- (UIImage *)imageForKey:(NSString *)key {
    return [self.imageCache objectForKey:key];
}

- (void)cleanCache {
    [self.imageCache removeAllObjects];
}

@end
