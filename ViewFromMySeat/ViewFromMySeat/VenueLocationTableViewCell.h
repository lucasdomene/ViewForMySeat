//
//  VenueLocationTableViewCell.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/25/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenueLocationTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *cityAndStateLabel;
@property (strong, nonatomic) IBOutlet UILabel *countryLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;

@end
