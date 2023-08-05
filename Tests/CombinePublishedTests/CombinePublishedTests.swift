//
//  CombinePublishedTests.swift
//  CombinePublishedTests
//
//  Created by Yu-Sung Loyi Hsu on 2023/8/6.
//

import Combine
@testable import CombinePublished
import XCTest

final class CombinePublishedTests: XCTestCase {
    func test_CombinePublished_noRetainCycle() {
        let testObject = TestObject()
        let publisher = ObjectPublished(wrapped: testObject)

        addTeardownBlock { [weak testObject, weak publisher] in
            XCTAssertNil(testObject)
            XCTAssertNil(publisher)
        }
    }

    func test_ValuePublished_noRetailCycle() {
        let goodNumber = ValuePublished(value: 0)
        var anyCancellables: Set<AnyCancellable> = []

        var output = [Int]()

        goodNumber.publisher
            .sink { value in
                output.append(value)
            }
            .store(in: &anyCancellables)

        goodNumber.value = 10
        goodNumber.value = 20
        goodNumber.value = 30

        XCTAssertEqual(output, [0, 10, 20, 30])

        addTeardownBlock { [weak goodNumber] in
            XCTAssertNil(goodNumber)
        }
    }
}

private class TestObject {}
