//
//  demo_autolayout__Tests.m
//  demo_autolayout学习Tests
//
//  Created by Lwgfangz on 14-9-24.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface demo_autolayout__Tests : XCTestCase

@end

@implementation demo_autolayout__Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
