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
                                                        .absoluteString
                                                        .trimmingPrefix("file://"))
        self.primeNumbers = PrimeNumberGenerator(std.string(strippedPath))
        //self.primeNumbers = PrimeNumberGenerator(std.string("../../"))
    }
    
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

    //These are currently private inside the generator.
//    public func randomInt(_ min:Int32, _ max:Int32) -> Int32 {
//        fancy_random(min, max)
//    }
    
//    public func randomUInt8(_ min:UInt8, _ max:UInt8) -> UInt8 {
//        random_uint8(min, max)
//    }
//    
//    public func randomInt(_ min:CUnsignedChar, _ max:CUnsignedChar) -> CUnsignedChar {
//        //random_uint8(min, max)
//        fancy_random(min, max)
//    }
    
    //TODO: why does swift think this need to be mutating?
    public mutating func nthPrime(n:Int32) -> Int32 {
        primeNumbers.prime_at(n)
    }

    //only works from CLI, but does work from CLI. Can open a file. 
    public mutating func openAndPrintATestFile(_ testFilePath:String) -> Int {
        //Int(primeNumbers.openFile())
        Int(cppTestFileRead(std.string(testFilePath)))
    }
    
    public func bundlePath() -> String {
        Bundle.module.bundlePath
    }

    public func getTheCWD() -> String {
        String(getCurrentWorkingDir())
    }
    //failed with non-zero exit code
    //  ////CxxInteropLibrary/Sources/InteropLibrary/ThingCatalog.swift:33:9
    //  ////Cannot convert return expression of type 'CUnsignedChar' (aka 'UInt8') to return type 'N'
//    public func randomIntGeneric<N: FixedWidthInteger>(_ min:N, _ max:N) -> N {
//        fancy_random(min, max)
//    }
    
    //And all of these cause a linker error.
//   public func randomNumber(_ min:CUnsignedInt, _ max:CUnsignedInt) -> CUnsignedInt {
//        fancy_random(min, max)
//    }
    
//     Note, when this is Int, Int8, UInt8 get "linker error"
//    public func randomNumber(_ min:Int8, _ max:Int8) -> Int8 {
//        fancy_random(min, max)
//    }
    
//    public func randomNumber(_ min:UInt8, _ max:UInt8) -> UInt8 {
//        fancy_random(min, max)
//    }
}
