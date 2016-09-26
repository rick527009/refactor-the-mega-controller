//
//  UpcomingTaskSection.swift
//  MegaController
//
//  Created by Andy Matuschak on 9/8/15.
//  Copyright © 2015 Andy Matuschak. All rights reserved.
//

import Foundation

enum UpcomingTaskSection: Int {
    case now
    case soon
    case upcoming
    
	init(forTaskDueDate date: Date, baseDate: Date, calendar: Calendar = Calendar.current) {
        let beginningOfDate = calendar.startOfDay(for: date)
        let beginningOfBaseDate = calendar.startOfDay(for: baseDate)
        let numberOfDaysUntilTaskDueDate = calendar.dateComponents([.day], from: beginningOfBaseDate, to: beginningOfDate).day!
        switch numberOfDaysUntilTaskDueDate {
        case -Int.max...2:
            self = .now
        case 3...5:
            self = .soon
        default:
            self = .upcoming
        }
    }
    
    var title: String {
        switch self {
        case .now: return "Now"
        case .soon: return "Soon"
        case .upcoming: return "Upcoming"
        }
    }
    
    static var numberOfSections: Int {
        return 3
    }
}
