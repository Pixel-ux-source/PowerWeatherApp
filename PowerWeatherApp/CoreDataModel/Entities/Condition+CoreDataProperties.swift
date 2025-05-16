//
//  Condition+CoreDataProperties.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//
//

import Foundation
import CoreData

@objc(Condition)
public class Condition: NSManagedObject { }

extension Condition {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Condition> {
        return NSFetchRequest<Condition>(entityName: "Condition")
    }

    @NSManaged public var icon: String?
    @NSManaged public var text: String?
    @NSManaged public var hourWeather: HourWeather?
    @NSManaged public var weather: Weather?

}

extension Condition : Identifiable { }
