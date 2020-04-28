//
//  EntryController.swift
//  Journal(Core Data)
//
//  Created by patelpra on 4/27/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    func createEntry(title: String, bodyText: String, withMood mood: EntryMood, timeStamp: Date? = Date(), identifier: String? = UUID().uuidString) {
        let _ = Entry(title: title, bodyText: bodyText, timestamp: timeStamp, identifier: identifier)
        saveToPersistentStore()
    }
    
    func updateEntry(entry: Entry, title: String, bodyText: String, withMood mood: EntryMood) {
        entry.title = title
        entry.bodyText = bodyText
        entry.mood = mood.rawValue
        entry.timestamp = Date()
        saveToPersistentStore()
    }
    
    func deleteEntry(entry: Entry) {
        CoreDataStack.shared.mainContext.delete(entry)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            NSLog("Error saving context, \(error)")
        }
    }
}
