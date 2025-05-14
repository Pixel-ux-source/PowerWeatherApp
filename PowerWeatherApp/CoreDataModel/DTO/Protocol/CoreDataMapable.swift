//
//  CoreDataMapable.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import Foundation
import CoreData

protocol CoreDataMapable {
    associatedtype Entity: NSManagedObject
    func map(in context: NSManagedObjectContext) throws -> Entity
}
