//
//  WeekWeatherModel.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import UIKit

struct WeekWeatherModel {
    let maxTemp: String
    let minTemp: String
    let avgTemp: String
    let maxWindSpeed: String
    let date: String
    let icon: URL?
    
    init(weather: Weather) {
        self.maxTemp = String(format: "%.1f°", weather.maxTemp)
        self.minTemp = String(format: "%.1f°", weather.minTemp)
        self.avgTemp = String(format: "%.1f°", weather.avgTemp)
        self.maxWindSpeed = String(format: "%.1f", weather.maxWindSpeed)
        self.date = weather.date?.formatedDate() ?? ""
        if let icon = weather.condition?.icon {
            self.icon = URL(string: "https:\(icon)")
        } else {
            self.icon = nil
        }
    }
}
