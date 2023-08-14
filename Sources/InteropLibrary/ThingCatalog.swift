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
        //TODO: Make an official std types canary.
        
        return String(received)
    }
    
    //TODO: Non string C++ inits from inside XCode.
    //TODO: Find where can find current state o' affairs
    //TODO: Clarify if ANY std header in C++ Lib means ALL avaiable Swift.
    public func stdTypesCanary() {
        //re-added to keep an eye on:
        let x = std.string("Howdy")
        
        //'std.__1.array<_Tp, _Size>' cannot be constructed because it has no accessible initializers
        //Generic parameter '_Tp' could not be inferred
        //Command SwiftCompile failed with a nonzero exit code
        //Below Set: Doesn't complain in XCode, borks compiler.
        //let test = std.array<Any, Any>(Array([2, 3, 4]))
        //let y = std.array<UInt8, UInt8>(3, [8, 4, 5])
        
        //cant make template.
        //let y = std.vector<CInt, CInt>(3, [8, 4, 5])
        
        //Expected 3, could not make template.
        //let z = std.set<Int32, Int32, Int32>(Set(3,2,1))
        
        //Generic type 'vector' specialized with too few type parameters (got 1, but expected 2)
        //No longer valid code.
        //https://forums.swift.org/t/relating-c-interoperability-to-former-objective-c-interoperability-providing-swift-overlays-for-c-standard-library-types-gsoc/56274/9
//        //import std this libs not a thing.
//        let s = std.vector<CInt>() // vector says it need 2 and then can't find template.
//        s.push_back(1)
//        s.push_back(2)
//        s.push_back(3)
//
//        for i in 0..<s.size() {
//            print(s[i])
//        }
    }
    
    //Confirmed still works.
//    func stdTypeParameter(s:std.string) {
//        print(s)
//    }

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

