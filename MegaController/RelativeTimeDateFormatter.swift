//
//  RelativeTimeDateFormatter.swift
//  MegaController
//
//  Created by Andy Matuschak on 9/8/15.
//  Copyright © 2015 Andy Matuschak. All rights reserved.
//

import Foundation

struct RelativeTimeDateFormatter {
    let calendar: Calendar
    
    init(calendar: Calendar = Calendar.autoupdatingCurrent) {
        self.calendar = calendar
    }
    
    func string(forDate date: Date, relativeToDate baseDate: Date) -> String {
        let beginningOfDate = calendar.startOfDay(for: date)
        let beginningOfBaseDate = calendar.startOfDay(for: baseDate)
        let numberOfCalendarDaysBetweenDates = calendar.dateComponents([.day], from: beginningOfBaseDate, to: beginningOfDate).day!

        switch numberOfCalendarDaysBetweenDates {
        case -Int.max ... -2:
            return "\(abs(numberOfCalendarDaysBetweenDates)) days ago"
        case -1:
            return "Yesterday"
        case 0:
            return "Today"
        case 1:
            return "Tomorrow"
        default:
            return "In \(numberOfCalendarDaysBetweenDates) days"
        }
    }
}
