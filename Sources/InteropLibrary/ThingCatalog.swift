//
//  /InteropLibrary/ThingCatalog.swift
//  CxxInteropLibrary
//
//  Created by Carlyn Maw on 8/9/23.
//
import Foundation
import cxxLibrary


public struct ThingCatalog {
    var primeNumbers:PrimeNumberGenerator

    public init() {
        let strippedPath = String(URL(filePath: Bundle.module.bundlePath)
                                                        .deletingLastPathComponent()
                                                        .path())
        self.primeNumbers = PrimeNumberGenerator(std.string(strippedPath))
    }

    //TODO: why does to be mutating again? Wanted that even before a reference type.
    public mutating func nthPrime(n:Int32) -> Int32 {
        primeNumbers.prime_at(n)
    }
    

    //MARK: Misc C++ Function Tests
    public func sendAndReceiveString(send:String) -> String {
        let received = echo_this(std.string(send))
        return String(received)
    }

    public func currentNumber() -> Int {
        return Int(my_favorite_number())
    }
    
    public func currentWord() -> String {
        return String(my_favorite_word())
    }

    //MARK: IntType Template Tests

    //Did work? Stopped working? 
    //Had worked, stopped working?
//    public func randomInt(_ min:Int32, _ max:Int32) -> Int32 {
//        fancy_random(min, max)
//    }
    
   public func randomUInt8(_ min:UInt8, _ max:UInt8) -> UInt8 {
       random_uint8(min, max)
   }
   
   public func randomInt(_ min:CUnsignedChar, _ max:CUnsignedChar) -> CUnsignedChar {
       fancy_random(min, max)
   }

//    //linker error.
//    public func randomNumber(_ min:CUnsignedInt, _ max:CUnsignedInt) -> CUnsignedInt {
//        fancy_random(min, max)
//    }
    
//    //linker error.
//    public func randomNumber(_ min:Int8, _ max:Int8) -> Int8 {
//        fancy_random(min, max)
//    }
    
//     //linker error.
//    public func randomNumber(_ min:UInt8, _ max:UInt8) -> UInt8 {
//        fancy_random(min, max)
//    }

    //NOT EXPECTED TO WORK. 
       //failed with non-zero exit code
    //  ////CxxInteropLibrary/Sources/InteropLibrary/ThingCatalog.swift:33:9
    //  ////Cannot convert return expression of type 'CUnsignedChar' (aka 'UInt8') to return type 'N'
    //    public func randomIntGeneric<N: FixedWidthInteger>(_ min:N, _ max:N) -> N {
    //        fancy_random(min, max)
    //    }
    
    
    //MARK: System and FileIO
    public func bundlePath() -> String {
        Bundle.module.bundlePath
    }

    public func getTheCWD() -> String {
        String(getCurrentWorkingDir())
    }

    public mutating func openAndPrintATestFile(_ testFilePath:String) -> Int {
        //Int(primeNumbers.openFile())
        Int(cppTestFileRead(std.string(testFilePath)))
    }

}


//MARK: Not yet interop-ing

