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
}

private class TestObject {}
