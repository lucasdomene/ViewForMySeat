//
//  UIAlertController+CustomAlertsTests.m
//  ViewFromMySeat
//
//  Created by Lucas Domene Firmo on 9/26/16.
//  Copyright © 2016 Domene. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIAlertController+CustomAlerts.h"

@interface UIAlertController_CustomAlertsTests : XCTestCase

@end

@implementation UIAlertController_CustomAlertsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCustomAlertControlCreation {
    UIAlertController * alertController = [[UIAlertController alloc] initWithError:nil andRetryBlock:nil];
    
    XCTAssertNotNil(alertController);
}

@end
