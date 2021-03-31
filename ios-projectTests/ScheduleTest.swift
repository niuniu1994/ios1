//
//  ScheduleTest.swift
//  ios-projectTests
//
//  Created by Kaining Xin on 28/03/2021.
//

import XCTest
@testable import ios_project

class ScheduleTest: XCTestCase {
   

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetSchedule() throws {
        HttpServices.getScheduleList().done{ records in
            XCTAssertNil(records)
            XCTAssertTrue(records.count > 0)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
