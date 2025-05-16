//
//  String.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import Foundation

extension String {
    func withoutDash() -> String {
        self.replacingOccurrences(of: "-", with: " ")
    }
}

extension String {
    func formatedDate() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.locale = Locale(identifier: "ru_RU")
        
        guard let date = inputFormatter.date(from: self) else {
            print("Невозможно распарсить дату")
            return self
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMMM"
        outputFormatter.locale = Locale(identifier: "ru_RU")
        
        let formattedString = outputFormatter.string(from: date)
        return formattedString
    }
}
