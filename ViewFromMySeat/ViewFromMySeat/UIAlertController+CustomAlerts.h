//
//  UIAlertController+CustomAlerts.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/26/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (CustomAlerts)

- (UIAlertController *)initWithError:(NSError *)error andRetryBlock:(void(^)())retryBlock;                                                        

@end
