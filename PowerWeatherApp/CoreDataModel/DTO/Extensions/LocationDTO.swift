//
//  LocationDTO.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import Foundation
import CoreData

extension LocationDTO: CoreDataMapable {
    func map(in context: NSManagedObjectContext) throws -> Location {
        return LocationMapper.map(from: self, for: context)
    }
    
    typealias Entity = Location
    
    
}
