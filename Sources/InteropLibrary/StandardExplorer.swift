//
//  StandardExplorer.swift
//  
//
//  Created by Labtanza on 8/15/23.
//


import CxxStdlib

//Container for testing what C++ types work with minimal viable import.
struct StandardExplorer {
    
    //TODO: Non string C++ inits from inside XCode.
    //TODO: Find where can find current state o' affairs
    
    func submitGossip(s:std.string) -> String {
        print(s)
        let x = std.string("Did you hear? ")
        return String(x + s)
    }
    
//    public func cecinestpasArray(a:std.array<UInt8, UInt8>) -> Array<UInt8> {
//        //'std.__1.array<_Tp, _Size>' cannot be constructed because it has no accessible initializers
//        //Generic parameter '_Tp' could not be inferred
//        //Command SwiftCompile failed with a nonzero exit code
//        //Below Set: Doesn't complain in XCode, borks compiler.
//        //let test = std.array<Any, Any>(Array([2, 3, 4]))
//        //let y = std.array<UInt8, UInt8>(3, [8, 4, 5])
//    }
    
//    public func vectorForVictor() -> Array<Int32> {
//        //v:std.vector<Int32, Int32>
//        //re-added to keep an eye on:
//        
//        //cant make template.
//        //let y = std.vector<CInt, CInt>(3, [8, 4, 5])
//
//        //Generic type 'vector' specialized with too few type parameters (got 1, but expected 2)
//        //No longer valid code.
//        //https://forums.swift.org/t/relating-c-interoperability-to-former-objective-c-interoperability-providing-swift-overlays-for-c-standard-library-types-gsoc/56274/9
////        //import std this libs not a thing.
////        let s = std.vector<CInt>() // vector says it need 2 and then can't find template.
////        s.push_back(1)
////        s.push_back(2)
////        s.push_back(3)
////
////        for i in 0..<s.size() {
////            print(s[i])
////        }
//
//    }
    
//    func deskSet() {
//        
//        //Expected 3, could not make template.
//        //let z = std.set<Int32, Int32, Int32>(Set(3,2,1))
//        
//    }


}
