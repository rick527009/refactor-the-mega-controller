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
        var beginningOfDate: Date? = nil
        var beginningOfBaseDate: Date? = nil
        
        (calendar as NSCalendar).range(of: .day, start: &beginningOfDate, interval: nil, for: date)
        (calendar as NSCalendar).range(of: .day, start: &beginningOfBaseDate, interval: nil, for: baseDate)
        let numberOfCalendarDaysBetweenDates = (calendar as NSCalendar).components(NSCalendar.Unit.day, from: beginningOfBaseDate!, to: beginningOfDate!, options: NSCalendar.Options()).day
        
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
