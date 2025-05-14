//
//  Hour+CoreDataProperties.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//
//

import Foundation
import CoreData

@objc(HourWeather)
public class HourWeather: NSManagedObject { }

extension HourWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HourWeather> {
        return NSFetchRequest<HourWeather>(entityName: "HourWeather")
    }

    @NSManaged public var time: String?
    @NSManaged public var temp: Float
    @NSManaged public var condition: Condition?
    @NSManaged public var weather: Weather?

}

extension HourWeather : Identifiable { }
