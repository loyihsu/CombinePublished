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
            let onGesture = { [weak publisher] in
                Logger().debug("tap gesture detected")
                publisher?.send(())
            }

            let action = TargetAction(closure: onGesture)

            let tapGestureRecongniser = UITapGestureRecognizer()
            tapGestureRecongniser.addAction(action)
            wrapped!.addGestureRecognizer(tapGestureRecongniser)

            return publisher.eraseToAnyPublisher()
        }
    }
#endif

class TargetAction {
    var closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    @objc func execute() {
        closure()
    }
}

extension UIGestureRecognizer {
    func addAction(_ targetAction: TargetAction) {
        addTarget(targetAction, action: #selector(targetAction.execute))
        Objc.retain(from: self, to: targetAction)
    }
}
