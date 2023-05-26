//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by dexiong on 2023/5/26.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataBase.dbManagedObjectContext(.privateQueueConcurrencyType).hub.performAndWait { context in
            let person1 = Person.init(context: context)
            person1.name = "Jack"
            person1.age = 12
            person1.modified = Date()
            
            let person2 = Person.init(context: context)
            person2.name = "Rose"
            person2.age = 16
            person2.modified = Date()
            
            try? context.hub.saveAndWait()
        }
        
        DispatchQueue(label: "thread1").async {
            DataBase.dbManagedObjectContext(.privateQueueConcurrencyType).hub.performAndWait { context in
                let freq: NSFetchRequest<Person> = Person.fetchRequest()
                freq.predicate = .init(format: "name = %@", "Jack")
                freq.fetchLimit = 1
                guard let obj = try? context.fetch(freq).first else { return }
                context.delete(obj)
                try? context.hub.saveAndWait()
            }
        }
        
        DispatchQueue(label: "thread2").async {
            DataBase.dbManagedObjectContext(.privateQueueConcurrencyType).hub.performAndWait { context in
                let freq: NSFetchRequest<Person> = Person.fetchRequest()
                freq.predicate = .init(format: "name = %@", "Jack")
                freq.returnsObjectsAsFaults = false
                freq.fetchLimit = 1
                guard let obj = try? context.fetch(freq).first else { return }
                Thread.sleep(forTimeInterval: 2)
                print(obj.abstract)
            }
        }
    }


}

