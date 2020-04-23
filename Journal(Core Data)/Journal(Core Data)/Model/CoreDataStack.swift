//
//  CoreDataStack.swift
//  Journal(Core Data)
//
//  Created by patelpra on 4/22/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Journal")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
        
    }()
    
    // Makes the access to the context faster
    // Reminds you to use the context on the main queue
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
