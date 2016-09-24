//
//  FeaturedPhotoTableViewCell.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/22/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "FeaturedPhotoTableViewCell.h"

@interface FeaturedPhotoTableViewCell()

@property (nonatomic) UIActivityIndicatorView *spinner;

@end

@implementation FeaturedPhotoTableViewCell

- (void)updateWithImage:(UIImage *)image {
    if (image) {
        [self.spinner stopAnimating];
    } else {
        [self.spinner startAnimating];
    }
    self.venueImageView.image = image;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self updateWithImage:nil];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self configureSpinner];
    [self updateWithImage:nil];
}

- (void)configureSpinner {
    _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
    _spinner.center = CGPointMake(CGRectGetMidX(self.venueImageView.frame), CGRectGetMidY(self.venueImageView.frame));
    _spinner.hidesWhenStopped = YES;
    [self.venueImageView addSubview:_spinner];
}

@end
