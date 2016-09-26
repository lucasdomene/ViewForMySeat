//
//  ZoomImageViewController.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/26/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenuesStore.h"
#import "Venue.h"

@interface ZoomImageViewController : UIViewController

@property (nonatomic) VenuesStore * venuesStore;
@property (nonatomic) Venue * venue;

@end
