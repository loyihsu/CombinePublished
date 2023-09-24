//
//  ObjectPublished+UISwitch.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/9/24.
//

#if canImport(UIKit)
    import Combine
    import OSLog
    import UIKit

    public extension ObjectPublished where Wrapped == UISwitch {
        /// Adds a tap gesture recogniser and returns a publisher.
        var tap: AnyPublisher<Void, Never> {
            let publisher = PassthroughSubject<Void, Never>()

            let onTap = { [weak publisher] in
                Logger().debug("switch touch detected")
                publisher?.send(())
            }

            let action = UIAction { _ in
                onTap()
            }

            wrapped?.addAction(action, for: .touchUpInside)

            return publisher.eraseToAnyPublisher()
        }

        /// A publisher of `UISwitch`'s `isOn` state.
        var isOn: AnyPublisher<Bool, Never> {
            tap
                .map { [weak wrapped] in
                    wrapped?.isOn ?? false
                }
                .eraseToAnyPublisher()
        }
    }
#endif
