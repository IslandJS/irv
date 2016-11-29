//
//  DataManager.swift
//  IRV
//
//  Created by William Anderson on 11/28/16.
//  Copyright © 2016 Bill Anderson. All rights reserved.
//

import Foundation
import CoreData

class DataManager {
    
    // MARK: - Type
    static let singleton = DataManager()
    
    // MARK: - Properties
    
    typealias voidClosure = (Void) -> (Void)
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "IRV")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? { fatalError("Unresolved error \(error), \(error.userInfo)") }
        })
        return container
        
    }()
    
    // MARK: - Save
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
