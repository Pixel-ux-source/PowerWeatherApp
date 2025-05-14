//
//  DTO Model.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import Foundation

struct LocationDTO: Decodable {
    let locationData: LocationData
    let forecast: ForeCastData
}

struct LocationData: Decodable {
    let country: String
    let region: String
}

struct ForeCastData: Decodable {
    let foreCastDay: [ForeCastDay]
}

struct ForeCastDay: Decodable {
    let date: String
    let day: [DayDto]
    let hour: [HourDto]
}

struct DayDto: Decodable {
    let maxTemp: Float
    let minTemp: Float
    let avgTemp: Float
    let maxWindSpeed: Float
}

struct HourDto: Decodable {
    let time: String
    let temp: Float
    let condition: ConditionDTO
}

struct ConditionDTO: Decodable {
    let text: String
    let icon: String
}
