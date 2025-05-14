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

        location.country = dto.locationData.country
        location.region = dto.locationData.region

        for day in dto.forecast.foreCastDay {
            let weather = Weather(context: context)
            day.day.forEach { element in
                weather.maxTemp = element.maxTemp
                weather.minTemp = element.minTemp
                weather.avgTemp = element.avgTemp
                weather.maxWindSpeed = element.maxWindSpeed
            }

            day.hour.forEach { element in
                let hourWeather = HourWeather(context: context)
                hourWeather.time = element.time
                hourWeather.temp = element.temp

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
