import XCTest
@testable import InteropLibrary

final class CxxInteropLibraryTests: XCTestCase {

    //MARK: Single Function Tests
    func testCurrentNumber() throws {
        XCTAssert(ThingCatalog().currentNumber() == 5)
    }
    
    func testCurrentWord() throws {
        XCTAssert(ThingCatalog().currentWord() == "melodious")
    }
    
    func testStrings() throws {
        XCTAssertEqual(ThingCatalog().sendAndReceiveString(send:"Nice to meet you"),
                       "Nice to meet you")
    }
    
    //MARK: Random Number Tests
    //Had worked, stopped working?
//    func testRandomNumber_Int32() throws {
//        let value:Int32 = ThingCatalog().randomInt(0, 1000)
//        XCTAssert((0...1000).contains(value))
//    }
    
    func testRandomNumber_UInt8() throws {
        let value:UInt8 = ThingCatalog().randomUInt8(20, 30)
        print(value)
        XCTAssert((20...30).contains(value))
    }
    
    func testRandomNumber_UInt8Try2() throws {

        let value:CUnsignedChar = ThingCatalog().randomInt(20, 30)
        print(value)
        XCTAssert((20...30).contains(value))
    }

    //Function not expected to work at all with current C++ interop libraries.
//  ////CxxInteropLibrary/Sources/InteropLibrary/ThingCatalog.swift:33:9
//  ////Cannot convert return expression of type 'CUnsignedChar' (aka 'UInt8') to return type 'N'
//    func testRandomNumber_FixedWidth() throws {
//        let value:UInt8 = ThingCatalog().randomIntGeneric(20, 30)
//        print(value)
//        XCTAssert((20...30).contains(value))
//    }

    //MARK: PrimeNumberGenerator Related
    func testChosenPrime() throws {
        var things = ThingCatalog()
        XCTAssertEqual(things.nthPrime(n: 998), 7901);
    }


    //MARK: Information gathering. Turn on and off ass needed.

//    //Passes, but verbose. off for now.
//    //TODO: Ad a short dummy file so can move this out of limbo.
//    func testOpenFile() throws {
//        var things = ThingCatalog()
//        XCTAssertEqual(things.openATestFile(), 0);
//    }
    
//    //Cannot pass.
//    func testLocateTheBundle() {
//        XCTAssertEqual(things.bundlePath(), "what/is/the/path");
//    }
//    func testCWD() throws {
//     var things = ThingCatalog()
//     XCTAssertEqual("test_test", things.getTheCWD())
//    }



}
