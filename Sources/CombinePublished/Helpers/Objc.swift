//
//  Objc.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/8/5.
//

import Foundation

/// A set of Swifty helpers for `objc`.
struct Objc {
    /// A helper that creates a retain from object to object.
    /// - parameter from: the source of retention
    /// - parameter to: the target of retention
    static func retain<Source: AnyObject, Target: AnyObject>(from: Source, to: Target) {
        objc_setAssociatedObject(from, "\(UUID())", to, .OBJC_ASSOCIATION_RETAIN)
    }
}
