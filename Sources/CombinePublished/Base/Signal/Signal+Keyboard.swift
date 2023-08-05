//
//  Signal+Keyboard.swift
//  CombinePublished
//
//  Created by Loyi Hsu on 2023/8/5.
//

#if canImport(UIKit)
    import Combine
    import UIKit

    extension Signal {
        func registerKeyboardEvents() {
            register(UIResponder.keyboardWillShowNotification, for: #selector(onKeyboardWillShow))
            register(UIResponder.keyboardDidShowNotification, for: #selector(onKeyboardDidShow))
            register(UIResponder.keyboardDidChangeFrameNotification, for: #selector(onKeyboardDidChangeFrame))
            register(UIResponder.keyboardWillHideNotification, for: #selector(onKeyboardWillHide))
            register(UIResponder.keyboardDidHideNotification, for: #selector(onKeyboardDidHide))
        }

        @objc private func onKeyboardWillShow() {
            keyboardWillShowSignal.send(())
            isKeyboardShownSignal.value = true
        }

        @objc private func onKeyboardDidShow() {
            keyboardDidShowSignal.send(())
        }

        @objc private func onKeyboardDidChangeFrame() {
            keyboardDidChangeFrameSignal.send(())
        }

        @objc private func onKeyboardWillHide() {
            keyboardWillHideSignal.send(())
            isKeyboardShownSignal.value = false
        }

        @objc private func onKeyboardDidHide() {
            keyboardDidHideSignal.send(())
        }
    }

    public extension Signal {
        var keyboardWillShow: AnyPublisher<Void, Never> {
            keyboardWillShowSignal
                .eraseToAnyPublisher()
        }

        var keyboardDidShow: AnyPublisher<Void, Never> {
            keyboardDidShowSignal
                .eraseToAnyPublisher()
        }

        var keyboardDidChangeFrame: AnyPublisher<Void, Never> {
            keyboardDidChangeFrameSignal
                .eraseToAnyPublisher()
        }

        var keyboardWillHide: AnyPublisher<Void, Never> {
            keyboardWillHideSignal
                .eraseToAnyPublisher()
        }

        var keyboardDidHide: AnyPublisher<Void, Never> {
            keyboardDidHideSignal
                .eraseToAnyPublisher()
        }

        var isKeyboardShown: AnyPublisher<Bool, Never> {
            isKeyboardShownSignal.publisher
                .removeDuplicates()
                .eraseToAnyPublisher()
        }
    }
#endif
