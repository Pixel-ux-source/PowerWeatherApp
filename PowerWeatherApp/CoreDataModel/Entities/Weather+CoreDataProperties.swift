//
//  Weather+CoreDataProperties.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//
//

import Foundation
import CoreData

@objc(Weather)
public class Weather: NSManagedObject { }

extension Weather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weather> {
        return NSFetchRequest<Weather>(entityName: "Weather")
    }

    @NSManaged public var maxTemp: Float
    @NSManaged public var avgTemp: Float
    @NSManaged public var minTemp: Float
    @NSManaged public var maxWindSpeed: Float
    @NSManaged public var date: String?
    @NSManaged public var condition: Condition?
    @NSManaged public var location: Location?
    @NSManaged public var hourWeather: NSSet?

}

// MARK: Generated accessors for hour
extension Weather {

    @objc(addHourWeatherObject:)
    @NSManaged public func addToHourWeather(_ value: HourWeather)

    @objc(removeHourWeatherObject:)
    @NSManaged public func removeFromHourWeather(_ value: HourWeather)

    @objc(addHourWeather:)
    @NSManaged public func addToHourWeather(_ values: NSSet)

    @objc(removeHourWeather:)
    @NSManaged public func removeFromHourWeather(_ values: NSSet)

}

extension Weather : Identifiable { }
