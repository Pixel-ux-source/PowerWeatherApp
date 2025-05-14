//
//  Location+CoreDataProperties.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//
//

import Foundation
import CoreData

@objc(Location)
public class Location: NSManagedObject { }

extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var country: String?
    @NSManaged public var region: String?
    @NSManaged public var weather: NSSet?

}

// MARK: Generated accessors for weather
extension Location {

    @objc(addWeatherObject:)
    @NSManaged public func addToWeather(_ value: Weather)

    @objc(removeWeatherObject:)
    @NSManaged public func removeFromWeather(_ value: Weather)

    @objc(addWeather:)
    @NSManaged public func addToWeather(_ values: NSSet)

    @objc(removeWeather:)
    @NSManaged public func removeFromWeather(_ values: NSSet)

}

extension Location : Identifiable { }
