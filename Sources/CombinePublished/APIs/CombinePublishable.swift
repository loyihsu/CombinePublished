//
//  CombinePublishable.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/8/5.
//

/// A protocol that allows creation of ``CombinePublished`` objects.
public protocol CombinePublishable {}

public extension CombinePublishable where Self: AnyObject {
    /// Creates `CombinePublished` object that wraps the object.
    var publisher: CombinePublished<Self> {
        CombinePublished(wrapped: self)
    }
}
