//
//  ImageStoreTests.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/26/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ImageStore.h"

@interface ImageStoreTests : XCTestCase

@end

@implementation ImageStoreTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testDidRetrieveImageStore {
    XCTAssertNotNil([ImageStore sharedInstance]);
}

- (void)testCacheImage {
    UIImage * image = [UIImage new];
    
    [[ImageStore sharedInstance] cacheImage:image forKey:@"10"];
    
    UIImage * cachedImage = [[ImageStore sharedInstance] imageForKey:@"10"];
    
    XCTAssertEqual(image, cachedImage);
}

- (void)testCleanCache {
    [[ImageStore sharedInstance] cacheImage:[UIImage new] forKey:@"10"];
    
    [[ImageStore sharedInstance] cleanCache];
    
    UIImage * cachedImage = [[ImageStore sharedInstance] imageForKey:@"10"];
    
    XCTAssertNil(cachedImage);
}

@end
