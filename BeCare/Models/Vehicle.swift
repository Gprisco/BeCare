//
//  VehicleModel.swift
//  beCare!
//
//  Created by Giovanni Prisco on 22/04/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import CoreData

public class Vehicle: NSManagedObject, Identifiable {
    @NSManaged public var name: String?
    @NSManaged public var year: Int32
    @NSManaged public var type: String?
    @NSManaged public var km: Int32
    @NSManaged public var reminder: Reminder?
    @NSManaged public var trip: Trip?
}

extension Vehicle {
    static func loadVehiclesFromFetchRequest() -> NSFetchRequest<Vehicle> {
        let request = Vehicle.fetchRequest() as! NSFetchRequest<Vehicle>
        let sort = NSSortDescriptor(key: "name", ascending: true)
        
        request.sortDescriptors = [sort]
        
        return request
    }
}
