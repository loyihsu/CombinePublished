//
//  ValuePublished.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/8/5.
//

import Combine

/// A wrapper class that allows for creating an reactive container for value types.
///
/// To edit the values inside the container, directly set the `value` inside.
///
/// To access the publisher, use the `publisher` endpoint. The publishers will publish changes when the value will be changed.

public class ValuePublished<WrappedValue> {
    private var publishers: [CurrentValueSubject<WrappedValue, Never>] = []

    public var value: WrappedValue {
        willSet {
            willSetTriggered(newValue)
        }
    }

    public init(value: WrappedValue) {
        self.value = value
    }

    public var publisher: AnyPublisher<WrappedValue, Never> {
        let publisher = CurrentValueSubject<WrappedValue, Never>(value)

        publishers.append(publisher)

        return publisher.eraseToAnyPublisher()
    }

    private func willSetTriggered(_ newValue: WrappedValue) {
        publishers.forEach {
            $0.send(newValue)
        }
    }
}
