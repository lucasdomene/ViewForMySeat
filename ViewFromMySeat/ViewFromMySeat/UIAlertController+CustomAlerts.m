//
//  UIAlertController+CustomAlerts.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/26/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import "UIAlertController+CustomAlerts.h"

@implementation UIAlertController (CustomAlerts)

- (UIAlertController *)initWithError:(NSError *)error andRetryBlock:(void(^)())retryBlock {
    NSString * errorMessage;

    if ([error.domain isEqualToString:NSURLErrorDomain] && error.code == NSURLErrorNotConnectedToInternet) {
        errorMessage = @"No internet connection!";
    } else {
        errorMessage = @"An error occurred!";
    }
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Ops!" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        retryBlock();
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    return alertController;
}

@end
