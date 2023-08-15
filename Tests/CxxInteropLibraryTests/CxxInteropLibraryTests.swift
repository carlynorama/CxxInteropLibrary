import XCTest
@testable import InteropLibrary

final class CxxInteropLibraryTests: XCTestCase {
    
    func testStrings() throws {
        XCTAssertEqual(ThingCatalog().sendAndReceiveString(send:"Nice to meet you"),
                       "Nice to meet you")
    }


}
