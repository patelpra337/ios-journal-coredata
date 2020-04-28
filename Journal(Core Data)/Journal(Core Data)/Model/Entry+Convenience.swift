//
//  Entry+Convenience.swift
//  Journal(Core Data)
//
//  Created by patelpra on 4/22/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import Foundation
import CoreData

enum EntryMood: String, CaseIterable {
    case sad = "☹️"
    case neutral = "😐"
    case happy = "😎"
}

extension Entry {
    @discardableResult convenience init(title: String, bodyText: String? = nil, mood: EntryMood = .neutral, timestamp: Date? = Date(), identifier: String? = UUID().uuidString,
        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.mood = mood.rawValue
        self.timestamp = timestamp
        self.identifier = identifier
    }
}
