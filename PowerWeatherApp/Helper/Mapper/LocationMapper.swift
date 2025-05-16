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
            weather.date = day.date
            
            let conditionDay = Condition(context: context)
            conditionDay.icon = day.day.condition.icon
            conditionDay.text = day.day.condition.text
            
            conditionDay.weather = weather
            weather.condition = conditionDay
            
            day.hour.forEach { element in
                let hourWeather = HourWeather(context: context)
                hourWeather.timeEpoch = element.timeEpoch
                hourWeather.temp = element.tempC

                let conditionHour = Condition(context: context)
                conditionHour.icon = element.condition.icon
                conditionHour.text = element.condition.text

                conditionHour.hourWeather = hourWeather
                hourWeather.condition = conditionHour

                hourWeather.weather = weather
                weather.addToHourWeather(hourWeather)
            }

            weather.location = location
            location.addToWeather(weather)
        }
        return location
    }
}
