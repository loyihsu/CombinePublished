@testable import CombinePublished
import XCTest

final class CombinePublishedTests: XCTestCase {
    func test_CombinePublished_noRetainCycle() throws {
        let testObject = TestObject()
        let publisher = CombinePublished(wrapped: testObject)

        addTeardownBlock { [weak testObject, weak publisher] in
            XCTAssertNil(testObject)
            XCTAssertNil(publisher)
        }
    }
}

private class TestObject {}
