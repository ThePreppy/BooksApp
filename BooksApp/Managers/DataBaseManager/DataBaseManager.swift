//
//  DataBaseManager.swift
//  BooksApp
//
//  Created by Alexander on 05.01.2023.
//

import CoreData

class DatabaseManager: DatabaseManagerProtocol {
    
    static let shared = DatabaseManager()
    
    private var container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    ///Coredata initialization
    private init() {
        container = NSPersistentContainer(name: Constants.Coredata.container)
        container.loadPersistentStores { description, error in
            Logger.info("Description: \(description), Error: \(error?.localizedDescription ?? "Nil")")
        }
        container.viewContext.mergePolicy = NSOverwriteMergePolicy
    }
    
    /// Save database progress.
    func save() {
        saveContext()
    }
    
    /// Fetch books list for the given `query` from the database.
    ///
    /// - Parameters:
    ///     - query: String that may be contained in book's title.
    ///
    /// - Returns: Books array for the given `query`.
    func fetchBooks(query: String) -> [BookModel] {
        let request: NSFetchRequest<BookEntity> = .init(entityName: String(describing: BookEntity.self))
        request.predicate = NSPredicate(format: "title CONTAINS %@", query)
        
        return models(request: request)
    }
    
    /// Fetch models array for the given `request`.
    ///
    /// - Parameters:
    ///     - request: NSFetchRequest - nil by default.
    ///
    /// - Returns: Models array for the given `request`.
    private func models<T: Coredatable>(request: NSFetchRequest<T.ModelType>? = nil) -> [T] {
        let modelsRequest: NSFetchRequest<T.ModelType>
        if let request = request {
            modelsRequest = request
        } else {
            modelsRequest = .init(entityName: String(describing: T.ModelType.self))
        }
        
        do {
            let result = try context.fetch(modelsRequest)
            let model: [T]? = result.mapToModels() as? [T]
            return model ?? []
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    private func saveContext() {
        context.performAndWait {
            guard context.hasChanges else { return }
            
            do {
                try context.save()
                Logger.info("Saving completed")
            } catch {
                Logger.error(error)
            }
            
        }
    }
    
}
