//
//  TimeFormatConverter.swift
//  ios-project
//
//  Created by Kaining Xin on 31/03/2021.
//

import Foundation

class TimeFormatConverter {
    static func convert(date: String) -> String{
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withYear,.withMonth,.withDay,.withTime,.withDashSeparatorInDate, .withColonSeparatorInTime]
        let date =  dateFormatter.date(from: date)!
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "YYYY-MM-dd hh:mm"
        var date1 = dateFormatter1.string(from: date)
        return date1
    }
}
