import XCTest
@testable import InteropLibrary
//@testable import NumberMaker

final class CxxInteropLibraryTests: XCTestCase {

    func testCurrentNumber() throws {
        XCTAssert(NumberMaker().currentNumber() == 3)
    }
}
