//
//  Compatible.swift
//  CoreDataDemo
//
//  Created by dexiong on 2023/5/26.
//

import Foundation

/// CompatibleWrapper
struct CompatibleWrapper<Base> {
    public let base: Base
    public init(base: Base) {
        self.base = base
    }
}

/// Compatible
protocol Compatible: AnyObject {}
extension Compatible {
    /// CompatibleWrapper<Self>
    public var hub: CompatibleWrapper<Self> {
        get { .init(base: self) }
        set { }
    }
}

/// CompatibleValue
protocol CompatibleValue {}
extension CompatibleValue {
    /// CompatibleWrapper<Self>
    public var hub: CompatibleWrapper<Self> {
        get { .init(base: self) }
        set { }
    }
}
