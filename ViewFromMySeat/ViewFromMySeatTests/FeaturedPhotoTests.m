//
//  FeaturedPhotoTests.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/26/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FeaturedPhoto.h"

@interface FeaturedPhotoTests : XCTestCase

@property (nonatomic) FeaturedPhoto * featuredPhoto;

@end

@implementation FeaturedPhotoTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    _featuredPhoto = nil;
    [super tearDown];
}

- (void)testFeaturePhotoCreation {
    _featuredPhoto = [[FeaturedPhoto alloc] initWithFeaturedPhotoID:@"10" venueName:@"Pacaembu" imagePath:@"imagePathTest" section:@"10" row:@"3" seat:@"80" views:@"1000" note:@"Nice place"];
    
    XCTAssertEqual(_featuredPhoto.featuredPhotoID, @"10");
    XCTAssertEqual(_featuredPhoto.venue, @"Pacaembu");
    XCTAssertEqual(_featuredPhoto.imagePath, @"imagePathTest");
    XCTAssertEqual(_featuredPhoto.section, @"10");
    XCTAssertEqual(_featuredPhoto.row, @"3");
    XCTAssertEqual(_featuredPhoto.seat, @"80");
    XCTAssertEqual(_featuredPhoto.views, @"1000");
    XCTAssertEqual(_featuredPhoto.note, @"Nice place");
}

- (void)testFeaturePhotoCreationWithJSON {
    NSDictionary * jsonDictionary = @{ @"index": @"10",
                                       @"venue": @"Pacaembu",
                                       @"image": @"imagePathTest",
                                       @"section": @"10",
                                       @"row": @"3",
                                       @"seat": @"80",
                                       @"views": @"1000",
                                       @"note": @"Nice place" };
    
    _featuredPhoto = [[FeaturedPhoto alloc] initWithJSON:jsonDictionary];
    
    XCTAssertEqual(_featuredPhoto.featuredPhotoID, @"10");
    XCTAssertEqual(_featuredPhoto.venue, @"Pacaembu");
    XCTAssertEqual(_featuredPhoto.imagePath, @"imagePathTest");
    XCTAssertEqual(_featuredPhoto.section, @"10");
    XCTAssertEqual(_featuredPhoto.row, @"3");
    XCTAssertEqual(_featuredPhoto.seat, @"80");
    XCTAssertEqual(_featuredPhoto.views, @"1000");
    XCTAssertEqual(_featuredPhoto.note, @"Nice place");
}

@end
