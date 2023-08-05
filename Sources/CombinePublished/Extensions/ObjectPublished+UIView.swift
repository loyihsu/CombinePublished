//
//  ObjectPublished+UIView.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/8/6.
//

#if canImport(UIKit)
    import Combine
    import OSLog
    import UIKit

    public extension ObjectPublished where Wrapped == UIView {
        /// Adds a tap gesture recogniser and returns a publisher.
        var tap: AnyPublisher<Void, Never> {
            let publisher = PassthroughSubject<Void, Never>()

            // Gesture action is registered in the CombinePublished object,
            // which will be called from `gestureDidDetect`.
            onGesture = { [weak publisher] in
                Logger().debug("tap gesture detected")
                publisher?.send(())
            }

            let tapGestureRecongniser = UITapGestureRecognizer()
            tapGestureRecongniser.addTarget(self, action: #selector(gestureDidDetect))
            wrapped!.addGestureRecognizer(tapGestureRecongniser)

            return publisher.eraseToAnyPublisher()
        }
    }
#endif
