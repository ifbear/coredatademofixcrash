//
//  Person+Extensions.swift
//  CoreDataDemo
//
//  Created by dexiong on 2023/5/26.
//

import Foundation

extension Person {
    struct Abstrct {
        internal let name: String
        internal let age: Int16
        internal let modified: Date
    }
    
    internal var abstract: Abstrct {
        return .init(name: name, age: age, modified: modified)
    }
}
