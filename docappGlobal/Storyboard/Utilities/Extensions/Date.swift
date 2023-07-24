//
//  Date.swift
//  docappGlobal
//
//  Created by DarkMoon on 09/03/23.
//

import Foundation

public extension Date {
    var calendar: Calendar { Calendar.current }
    
    var weekDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self).capitalized
    }
        
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self).capitalized
    }
    var myDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self).capitalized
    }
    
    var nextFourWeekDays: [String] {
        let formatter    = DateFormatter()
        formatter.dateFormat = "EEE"
        var totalWeekDaysArr = [String]()
        
        if let currDate = formatter.date(from: String(Date().weekDay)) {
            for i in 0...4 {
                let newDate = Date().calendar.date(byAdding: .day, value: i, to: currDate)
                totalWeekDaysArr.append(formatter.string(from: newDate!))
            }
        }
        return totalWeekDaysArr
    }
    
    var nextFourWeekDaysInNum: [String] {
        let formatter    = DateFormatter()
        formatter.dateFormat = "dd"
        var tempArrTwo = [String]()
        if let currDate = formatter.date(from:  String(Date().currentDate)) {
            for i in 0...4 {
                let newDate = Date().calendar.date(byAdding: .day, value: i, to: currDate)

                tempArrTwo.append(formatter.string(from: newDate!))
            }
        }
        return tempArrTwo
    }

}
