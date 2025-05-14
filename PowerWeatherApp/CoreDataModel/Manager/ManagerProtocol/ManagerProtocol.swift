//
//  ManagerProtocol.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import Foundation
import CoreData

protocol ManagerProtocol: AnyObject {
    
    init(container: NSPersistentContainer)
    
    func createData<M: CoreDataMapable>(from dto: M, completion: @escaping (Result<M.Entity, Error>) -> ())
    
    func loadData<T: NSManagedObject>(of type: T.Type, completion: @escaping ([T]) -> ())
}
