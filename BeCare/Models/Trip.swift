//
//  TripModel.swift
//  beCare!
//
//  Created by Giovanni Prisco on 22/04/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import CoreData

public class Trip: NSManagedObject, Identifiable {
    @NSManaged public var km: Int32
    @NSManaged public var date: Date?
    @NSManaged public var vehicle: Vehicle?
}

extension Trip {
    static func loadTripsFromFetchRequest() -> NSFetchRequest<Trip> {
        let request = Trip.fetchRequest() as! NSFetchRequest<Trip>
        let sort = NSSortDescriptor(key: "date", ascending: true)
        
        request.sortDescriptors = [sort]
        
        return request
    }
}
