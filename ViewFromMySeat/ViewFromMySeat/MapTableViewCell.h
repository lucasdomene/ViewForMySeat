//
//  MapTableViewCell.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/26/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
