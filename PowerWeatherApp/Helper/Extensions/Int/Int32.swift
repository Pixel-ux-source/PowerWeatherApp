//
//  Int32.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import Foundation

extension Int32 {
    func unixDateFormatted() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = .current
        
        let string = formatter.string(from: date)
        return string
    }
}
