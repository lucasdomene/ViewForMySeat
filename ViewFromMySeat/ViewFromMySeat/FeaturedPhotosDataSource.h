//
//  FeaturedPhotosDataSource.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FeaturedPhotosDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, copy) NSMutableArray *featuredPhotos;

- (instancetype)initWithFeaturedPhotos:(NSMutableArray *)featuredPhotos;

@end
