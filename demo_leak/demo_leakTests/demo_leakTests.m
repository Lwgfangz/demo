//
//  demo_leakTests.m
//  demo_leakTests
//
//  Created by Lwgfangz on 14-7-23.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface demo_leakTests : XCTestCase

@end

@implementation demo_leakTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
