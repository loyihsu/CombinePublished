//
//  ObjectPublishable.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/8/5.
//

/// A protocol that allows creation of ``ObjectPublished`` objects.
public protocol ObjectPublishable {}

public extension ObjectPublishable where Self: AnyObject {
    /// Creates `CombinePublished` object that wraps the object.
    var publisher: ObjectPublished<Self> {
        ObjectPublished(wrapped: self)
    }
}
