//
//  ReminderModel.swift
//  beCare!
//
//  Created by Giovanni Prisco on 22/04/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import CoreData

public class Reminder: NSManagedObject, Identifiable {
    @NSManaged public var name: String?
    @NSManaged public var deadline_date: Date?
    @NSManaged public var deadline_km: Int32
    @NSManaged public var category: String?
    @NSManaged public var expense: Double
    @NSManaged public var vehicle: Vehicle?
}

extension Reminder {
    static func loadRemindersFromFetchRequest() -> NSFetchRequest<Reminder> {
        let request = Reminder.fetchRequest() as! NSFetchRequest<Reminder>
        let sort = NSSortDescriptor(key: "name", ascending: true)
        
        request.sortDescriptors = [sort]
        
        return request
    }
}
