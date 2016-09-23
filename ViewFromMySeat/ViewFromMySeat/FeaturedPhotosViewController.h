//
//  FeaturedPhotosViewController.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeaturedPhotosStore.h"
#import "VenuesStore.h"

@interface FeaturedPhotosViewController : UITableViewController <UITableViewDelegate>

@property (nonatomic) FeaturedPhotosStore * featuredPhotoStore;
@property (nonatomic) VenuesStore * venuesStore;

@end

