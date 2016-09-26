//
//  VenueTests.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/26/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Venue.h"

@interface VenueTests : XCTestCase

@property (nonatomic) Venue * venue;

@end

@implementation VenueTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    _venue = nil;
    [super tearDown];
}


- (void)testVenueCreation {
    _venue = [[Venue alloc] initWithVenueID:@"10" name:@"Pacaembu" imagePath:@"testImagePath" address:@"testAddress" city:@"testCity" state:@"testState" country:@"testCountry" averageRating:@"5" stats:@"testStats"];
    
    XCTAssertEqual(_venue.venueID, @"10");
    XCTAssertEqual(_venue.name, @"Pacaembu");
    XCTAssertEqual(_venue.imagePath, @"testImagePath");
    XCTAssertEqual(_venue.address, @"testAddress");
    XCTAssertEqual(_venue.city, @"testCity");
    XCTAssertEqual(_venue.state, @"testState");
    XCTAssertEqual(_venue.country, @"testCountry");
    XCTAssertEqual(_venue.averageRating, @"5");
    XCTAssertEqual(_venue.stats, @"testStats");
}

- (void)testVenueCreationWithJSON {
    NSDictionary * jsonDictionary = @{ @"id": @"10",
                                       @"name": @"Pacaembu",
                                       @"newest_image": @"testImagePath",
                                       @"address": @"testAddress",
                                       @"city": @"testCity",
                                       @"state": @"testState",
                                       @"country": @"testCountry",
                                       @"average_rating": @"5",
                                       @"stats": @"testStats" };
    
    _venue = [[Venue alloc] initWithJSON:jsonDictionary];
   
    XCTAssertEqual(_venue.venueID, @"10");
    XCTAssertEqual(_venue.name, @"Pacaembu");
    XCTAssertEqual(_venue.imagePath, @"testImagePath");
    XCTAssertEqual(_venue.address, @"testAddress");
    XCTAssertEqual(_venue.city, @"testCity");
    XCTAssertEqual(_venue.state, @"testState");
    XCTAssertEqual(_venue.country, @"testCountry");
    XCTAssertEqual(_venue.averageRating, @"5");
    XCTAssertEqual(_venue.stats, @"testStats");
}

@end
