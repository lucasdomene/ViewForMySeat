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
    self.imageView.image = _venue.image;
    if (_venue.image) {
        self.imageView.image = _venue.image;
    } else {
        [_venue addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"image"]) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = _venue.image;
        }];
        [_venue removeObserver:self forKeyPath:@"image"];
    }
}


@end
