//
//  LocationMapper.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import Foundation
import CoreData

struct LocationMapper {
    static func map(from dto: LocationDTO, for context: NSManagedObjectContext) -> Location {
        let location = Location(context: context)

        location.country = dto.location.country
        location.region = dto.location.region

        for day in dto.forecast.forecastDay {
            let weather = Weather(context: context)
            weather.maxTemp = day.day.maxTemp
            weather.minTemp = day.day.minTemp
            weather.avgTemp = day.day.avgTemp
            weather.maxWindSpeed = day.day.maxWindSpeed
            
            day.hour.forEach { element in
                let hourWeather = HourWeather(context: context)
                hourWeather.time = element.time
                hourWeather.temp = element.tempC

                let condition = Condition(context: context)
                condition.icon = element.condition.icon
                condition.text = element.condition.text

                condition.hourWeather = hourWeather
                hourWeather.condition = condition

                hourWeather.weather = weather
                weather.addToHourWeather(hourWeather)
            }

            weather.location = location
            location.addToWeather(weather)
        }
        return location
    }
}
