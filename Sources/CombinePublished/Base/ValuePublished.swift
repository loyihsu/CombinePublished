//
//  ValuePublished.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/8/5.
//

import Combine

/// A wrapper class that allows for creating an reactive container for value types.
public class ValuePublished<WrappedValue> {
    /// The contained value. Setting this value will trigger publishing to all the subscribers.
    public var value: WrappedValue {
        willSet {
            publisher.send(newValue)
        }
    }

    /// Get the publisher to subscribe to.
    /// The publisher will publish changes when the value is going to be changed (`willSet`).
    public lazy var publisher = CurrentValueSubject<WrappedValue, Never>(value)

    /// Creates a container that can be observable with the `value`.
    public init(value: WrappedValue) {
        self.value = value
    }
}
