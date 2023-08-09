import XCTest
@testable import InteropLibrary

final class CxxInteropLibraryTests: XCTestCase {

    func testCurrentNumber() throws {
        XCTAssert(ThingCatalog().currentNumber() == 5)
    }
    
    func testCurrentWord() throws {
        XCTAssert(ThingCatalog().currentWord() == "melodious")
    }
}
