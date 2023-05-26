//
//  DataBase.swift
//  CoreDataDemo
//
//  Created by dexiong on 2023/5/26.
//

import Foundation
import CoreData

class DataBase {
    
    internal static let shared: DataBase = .init()
    
    internal let container: NSPersistentContainer
    
    internal init() {
        container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    internal func ready() {
        
    }
}

extension DataBase {
    
    /// dbManagedObjectContext
    /// - Parameter concurrencyType: NSManagedObjectContextConcurrencyType
    /// - Returns: NSManagedObjectContext
    internal static func dbManagedObjectContext(_ concurrencyType: NSManagedObjectContextConcurrencyType) -> NSManagedObjectContext {
        let ctx: NSManagedObjectContext = .init(concurrencyType: concurrencyType)
        ctx.persistentStoreCoordinator = DataBase.shared.container.persistentStoreCoordinator
        // ctx.parent = DataBase.shared.container.viewContext
        ctx.automaticallyMergesChangesFromParent = true
        ctx.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        return ctx
    }
}

