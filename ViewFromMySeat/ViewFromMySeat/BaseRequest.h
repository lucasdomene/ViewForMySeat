//
//  BaseRequest.h
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/23/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseRequest : NSObject

- (void)makeRequest:(NSURLRequest *)request withCompletion:(void(^)(NSData * data, NSError * error))completion;

@end
