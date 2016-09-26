//
//  FeaturedPhotoTableViewCell.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeaturedPhotoTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *venueImageView;
@property (strong, nonatomic) IBOutlet UILabel *venueNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *seatLabel;
@property (strong, nonatomic) IBOutlet UILabel *notesLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberOfViewsLabel;
@property (strong, nonatomic) IBOutlet UIImageView *zoomImage;

- (void)updateWithImage:(UIImage *)image;

@end
