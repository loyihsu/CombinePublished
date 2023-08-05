//
//  SignalPublished.swift
//
//
//  Created by Loyi Hsu on 2023/8/5.
//

import Combine
import Foundation

/// Publishers of common signals/notifications.
public class Signal {
    // MARK: - Properties

    // MARK: Keyboard

    let keyboardWillShowSignal = PassthroughSubject<Void, Never>()
    let keyboardDidShowSignal = PassthroughSubject<Void, Never>()
    let keyboardDidChangeFrameSignal = PassthroughSubject<Void, Never>()
    let keyboardWillHideSignal = PassthroughSubject<Void, Never>()
    let keyboardDidHideSignal = PassthroughSubject<Void, Never>()
    let isKeyboardShownSignal = ValuePublished<Bool>(value: false)

    // MARK: - Base

    public static let publisher = Signal()

    private var registeredNotifications: [Notification.Name] = []

    init() {
        #if canImport(UIKit)
            registerKeyboardEvents()
        #endif
    }

    deinit {
        registeredNotifications.forEach {
            NotificationCenter.default.removeObserver(self, name: $0, object: nil)
        }
    }

    func register(_ notification: Notification.Name, for selector: Selector) {
        registeredNotifications.append(notification)
        NotificationCenter.default.addObserver(self, selector: selector, name: notification, object: nil)
    }
}
