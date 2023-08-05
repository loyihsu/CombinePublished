//
//  ObjectPublished.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/8/5.
//

#if canImport(UIKit)
    import UIKit
#endif
import OSLog

/// A wrapper class that allows for defining endpoints for creation of combine publishers.
public class ObjectPublished<Wrapped: AnyObject> {
    // MARK: - Base

    /// Holds a weak reference to the corresponding wrapped object.
    /// - Attention: A reference from the wrapped object to the publisher will be created on initialisation,
    /// so this reference is weakened to prevent retain cycle.
    weak var wrapped: Wrapped?

    /// Create an `ObjectPublished` object that wraps around the object.
    /// - Tip: A helper is available for this to create an `ObjectPublished` object
    /// through `AnyObject` using `object.publisher`.
    public init(wrapped: Wrapped) {
        self.wrapped = wrapped

        // Creates a retain from the object to the `CombinePublished` object
        // to ensure that it won't be freed from memory before use.
        Objc.retain(from: wrapped, to: self)
    }

    deinit {
        let className = "\(self.self)"
        Logger().info("\(className) is deinited.")
    }
}
