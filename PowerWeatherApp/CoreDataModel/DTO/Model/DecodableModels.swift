//
//  DTO Model.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import Foundation

// MARK: – Главная модель
struct LocationDTO: Decodable {
    let location: LocationData
    let current: CurrentData
    let forecast: ForecastData
}

// MARK: – Локация
struct LocationData: Decodable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tzId: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzId = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

// MARK: – Текущая погода
struct CurrentData: Decodable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Float
    let isDay: Int
    let condition: ConditionDTO
    let windMph: Float
    let windKph: Float
    let windDegree: Int
    let windDir: String
    let pressureMb: Float
    let pressureIn: Float
    let precipMm: Float
    let precipIn: Float
    let humidity: Int
    let cloud: Int
    let feelslikeC: Float
    let feelslikeF: Float
    let windchillC: Float
    let windchillF: Float
    let heatindexC: Float
    let heatindexF: Float
    let dewpointC: Float
    let dewpointF: Float
    let visKm: Float
    let visMiles: Float
    let uv: Float
    let gustMph: Float
    let gustKph: Float

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: – Прогноз
struct ForecastData: Decodable {
    let forecastDay: [ForecastDay]
    
    enum CodingKeys: String, CodingKey {
        case forecastDay = "forecastday"
    }
}

// MARK: – Прогноз на день
struct ForecastDay: Decodable {
    let date: String
    let dateEpoch: Int
    let day: DayDto
    let astro: AstroDto
    let hour: [HourDto]

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

struct DayDto: Decodable {
    let maxTemp: Float
    let minTemp: Float
    let avgTemp: Float
    let maxWindSpeed: Float
    let totalPrecipMm: Float
    let totalPrecipIn: Float
    let totalSnowCm: Float
    let avgVisKm: Float
    let avgVisMiles: Float
    let avgHumidity: Int
    let willItRain: Int
    let chanceOfRain: Int
    let willItSnow: Int
    let chanceOfSnow: Int
    let condition: ConditionDTO
    let uv: Float

    enum CodingKeys: String, CodingKey {
        case maxTemp = "maxtemp_c"
        case minTemp = "mintemp_c"
        case avgTemp = "avgtemp_c"
        case maxWindSpeed = "maxwind_kph"
        case totalPrecipMm = "totalprecip_mm"
        case totalPrecipIn = "totalprecip_in"
        case totalSnowCm = "totalsnow_cm"
        case avgVisKm = "avgvis_km"
        case avgVisMiles = "avgvis_miles"
        case avgHumidity = "avghumidity"
        case willItRain = "daily_will_it_rain"
        case chanceOfRain = "daily_chance_of_rain"
        case willItSnow = "daily_will_it_snow"
        case chanceOfSnow = "daily_chance_of_snow"
        case condition
        case uv
    }
}

struct AstroDto: Decodable {
    let sunrise, sunset, moonrise, moonset: String
    let moonPhase: String
    let moonIllumination: Int
    let isMoonUp: Int
    let isSunUp: Int

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

struct HourDto: Decodable {
    let timeEpoch: Int
    let time: String
    let tempC: Float
    let isDay: Int
    let condition: ConditionDTO
    let windMph: Float
    let windKph: Float
    let windDegree: Int
    let windDir: String
    let pressureMb: Float
    let pressureIn: Float
    let precipMm: Float
    let precipIn: Float
    let snowCm: Float
    let humidity: Int
    let cloud: Int
    let feelslikeC: Float
    let windchillC: Float
    let heatindexC: Float
    let dewpointC: Float
    let willItRain: Int
    let chanceOfRain: Int
    let willItSnow: Int
    let chanceOfSnow: Int
    let visKm: Float
    let gustMph: Float
    let gustKph: Float
    let uv: Float

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case snowCm = "snow_cm"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case windchillC = "windchill_c"
        case heatindexC = "heatindex_c"
        case dewpointC = "dewpoint_c"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKm = "vis_km"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}

struct ConditionDTO: Decodable {
    let text: String
    let icon: String
    let code: Int
}
