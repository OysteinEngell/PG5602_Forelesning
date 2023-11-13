//
//  Store+CoreDataProperties.swift
//  pg6502-app
//
//  Created by Øystein Engell on 31/10/2023.
//
//

import Foundation
import CoreData


extension Store {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Store> {
        return NSFetchRequest<Store>(entityName: "Store")
    }

    @NSManaged public var latitude: Float
    @NSManaged public var longitude: Float
    @NSManaged public var name: String?
    @NSManaged public var openingHours: String?

}

extension Store : Identifiable {

}
