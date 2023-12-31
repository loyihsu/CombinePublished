//
//  ObjectPublished+UIScrollView.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/8/5.
//

#if canImport(UIKit)
    import Combine
    import UIKit

    public extension ObjectPublished where Wrapped: UIScrollView {
        /// A publisher of the content offset of any `UIScrollView`.
        var contentOffset: AnyPublisher<CGPoint, Never> {
            let subject = CurrentValueSubject<CGPoint, Never>(.zero)

            let observation = wrapped!.observe(\.contentOffset, options: [.old, .new]) { _, change in
                guard let newValue = change.newValue else { return }
                subject.send(newValue)
            }

            // Prevent the observation to be freed when still needed.
            Objc.retain(from: self, to: observation)

            return subject.eraseToAnyPublisher()
        }
    }
#endif
