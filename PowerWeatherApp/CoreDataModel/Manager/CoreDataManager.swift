//
//  Manager.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import Foundation
import CoreData

final class CoreDataManager: ManagerProtocol {
    // MARK: – Container
    private let container: NSPersistentContainer

    // MARK: – Initializate
    init(container: NSPersistentContainer) {
        self.container = container
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: – Create
    func createData<M>(from dto: M, completion: @escaping (Result<M.Entity, any Error>) -> ()) where M : CoreDataMapable {
        createObject(from: dto, completion: completion)
    }
    
    private func createObject<M: CoreDataMapable>(from dto: M, completion: @escaping(Result<M.Entity,Error>) -> ()) {
        container.performBackgroundTask { context in
            do {
                let entity = try dto.map(in: context)
                try context.save()
                
                let objectID = entity.objectID
                
                DispatchQueue.main.async {
                    let mainContextEntity = self.container.viewContext.object(with: objectID) as! M.Entity
                    completion(.success(mainContextEntity))
                }
            } catch let error as NSError {
                context.rollback()
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    // MARK: – Read
    func loadData<T>(of type: T.Type, completion: @escaping ([T]) -> ()) where T : NSManagedObject {
        fetch(of: type, completion: completion)
    }
    
    private func fetch<T: NSManagedObject>(of type: T.Type, completion: @escaping ([T]) -> ()) {
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self))
        container.performBackgroundTask { context in
            do {
                let objects = try context.fetch(fetchRequest)
                let objectsID = objects.map { $0.objectID }
                DispatchQueue.main.async {
                    let mainContextObject: [T] = objectsID.compactMap {
                        self.container.viewContext.object(with: $0) as? T
                    }
                    completion(mainContextObject)
                }
            } catch let error as NSError {
                DispatchQueue.main.async {
                    completion([])
                }
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    
    // MARK: – Update
}
