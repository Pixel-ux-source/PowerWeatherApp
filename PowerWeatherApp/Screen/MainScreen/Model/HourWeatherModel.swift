//
//  HourWeatherModel.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import UIKit

struct HourWeatherModel {
    let time: String
    let temp: String
    let icon: URL?
    
    init(hourWeather: HourWeather) {
        self.time = hourWeather.timeEpoch.unixDateFormatted()
        self.temp = String(format: "%.1f°", hourWeather.temp)
        if let icon = hourWeather.condition?.icon {
            self.icon = URL(string: "https:\(icon)")
        } else {
            self.icon = nil
        }
    }
}
