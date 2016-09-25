//
//  RelativeTimeDateFormatterTests.swift
//  MegaController
//
//  Created by Andy Matuschak on 9/8/15.
//  Copyright © 2015 Andy Matuschak. All rights reserved.
//

@testable import MegaController
import XCTest

class RelativeTimeDateFormatterTests: XCTestCase {
    let calendar = Calendar.current
    let baseDate = Date(timeIntervalSinceReferenceDate: 0)
    
    var dateFormatter: RelativeTimeDateFormatter!
    override func setUp() {
        dateFormatter = RelativeTimeDateFormatter(calendar: calendar)
    }
    
    func testTodayDate() {
        let testDate = calendar.date(byAdding: .hour, value: 1, to: baseDate)!
        XCTAssertEqual(dateFormatter.string(forDate: testDate, relativeToDate: baseDate), "Today")
    }
    
    func testTomorrowDate() {
        let testDate = calendar.date(byAdding: .day, value: 1, to: baseDate)!
        XCTAssertEqual(dateFormatter.string(forDate: testDate, relativeToDate: baseDate), "Tomorrow")
    }
    
    func testLaterDate() {
        let testDate = calendar.date(byAdding: .day, value: 4, to: baseDate)!
        XCTAssertEqual(dateFormatter.string(forDate: testDate, relativeToDate: baseDate), "In 4 days")
    }
}
