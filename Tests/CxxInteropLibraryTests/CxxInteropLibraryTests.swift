import XCTest
@testable import InteropLibrary

final class CxxInteropLibraryTests: XCTestCase {

    func testCurrentNumber() throws {
        XCTAssert(ThingCatalog().currentNumber() == 5)
    }
    
    func testCurrentWord() throws {
        XCTAssert(ThingCatalog().currentWord() == "melodious")
    }
    
    func testRandomNumber_Int32() throws {
        let value:Int32 = ThingCatalog().randomInt(0, 1000)
        XCTAssert((0...1000).contains(value))
    }
    
    func testRandomNumber_UInt8() throws {
        let value:UInt8 = ThingCatalog().randomUInt8(20, 30)
        print(value)
        XCTAssert((20...30).contains(value))
    }
    
    func testRandomNumber_UInt8Try2() throws {
        //CUnisgnedChar works but UInt8 did not?
        let value:CUnsignedChar = ThingCatalog().randomInt(20, 30)
        print(value)
        XCTAssert((20...30).contains(value))
    }
    
   func testChosenPrime() throws {
       //Does not find file.
       let things = ThingCatalog()
       XCTAssertEqual(things.bundlePath(), "what/is/the/path");
       XCTAssertEqual(things.nthPrime(n: 998), 7901);
   }
//
//  ////CxxInteropLibrary/Sources/InteropLibrary/ThingCatalog.swift:33:9
//  ////Cannot convert return expression of type 'CUnsignedChar' (aka 'UInt8') to return type 'N'
//    func testRandomNumber_FixedWidth() throws {
//        let value:UInt8 = ThingCatalog().randomIntGeneric(20, 30)
//        print(value)
//        XCTAssert((20...30).contains(value))
//    }
    
//    func testRandomNumber_CUInt() throws {
//        let value:CUnsignedInt = ThingCatalog().randomNumber(0, 5)
//        XCTAssert((0...5).contains(value))
//    }
}
