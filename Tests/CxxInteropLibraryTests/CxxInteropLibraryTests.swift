import XCTest
@testable import InteropLibrary

final class CxxInteropLibraryTests: XCTestCase {

    func testCurrentNumber() throws {
        XCTAssert(NumberMaker().currentNumber() == 5)
    }
}
