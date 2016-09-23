//
//  VenueViewController.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenuesStore.h"
#import "FeaturedPhoto.h"

@interface VenueViewController : UITableViewController

@property (nonatomic) VenuesStore * venuesStore;
@property (nonatomic) FeaturedPhoto * featuredPhoto;

@end
