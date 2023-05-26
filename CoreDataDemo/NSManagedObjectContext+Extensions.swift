//
//  Extensions.swift
//  CoreDataDemo
//
//  Created by dexiong on 2023/5/26.
//

import Foundation
import CoreData

extension NSManagedObjectContext: Compatible {}
extension CompatibleWrapper where Base: NSManagedObjectContext {
    
    internal func perform(_ block: @escaping () -> Void) {
        base.perform(block)
    }
    
    internal func perform(_ block: @escaping (NSManagedObjectContext) -> Void) {
        base.perform {
            block(base)
        }
    }
    
    internal func performAndWait(_ block: () -> Void) {
        base.performAndWait(block)
    }
    
    internal func performAndWait(_ block: (NSManagedObjectContext) -> Void) {
        base.performAndWait {
            block(base)
        }
    }
    
    internal func saveAndWait() throws {
        try base.save()
        if base.parent?.hasChanges == true {
            try base.parent?.hub.saveAndWait()
        }
    }
}
