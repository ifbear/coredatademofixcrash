//
//  Person+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by dexiong on 2023/5/26.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String
    @NSManaged public var age: Int16
    @NSManaged public var modified: Date

}

extension Person : Identifiable {

}
