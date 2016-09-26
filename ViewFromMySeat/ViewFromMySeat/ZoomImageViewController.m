//
//  ZoomImageViewController.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/26/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "ZoomImageViewController.h"
#import "UIAlertController+CustomAlerts.h"

@interface ZoomImageViewController ()

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ZoomImageViewController

#pragma mark - View life Cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchVenueImage];
}

#pragma mark - View Life Cycle

- (void)fetchVenueImage {
    [_spinner startAnimating];
    [_venuesStore fetchVenueImageForVenue:_venue withCompletion:^(UIImage *image, NSError *error) {
        if (error) {
            UIAlertController * alertController = [[UIAlertController alloc] initWithError:error andRetryBlock:^{
                [self fetchVenueImage];
            }];
            [self presentViewController:alertController animated:true completion:nil];
        } else if (image) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.imageView.image = image;
            }];
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [_spinner stopAnimating];
        }];
    }];
}

@end
