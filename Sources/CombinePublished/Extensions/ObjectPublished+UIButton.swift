//
//  ObjectPublished+UIButton.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/8/13.
//

#if canImport(UIKit)
    import Combine
    import OSLog
    import UIKit

    public extension ObjectPublished where Wrapped == UIButton {
        /// Adds a tap gesture recogniser and returns a publisher.
        var tap: AnyPublisher<Void, Never> {
            let publisher = PassthroughSubject<Void, Never>()

            let onTap = { [weak publisher] in
                Logger().debug("button touch detected")
                publisher?.send(())
            }

            let action = UIAction { _ in
                onTap()
            }

            wrapped?.addAction(action, for: .touchUpInside)

            return publisher.eraseToAnyPublisher()
        }
    }
#endif
