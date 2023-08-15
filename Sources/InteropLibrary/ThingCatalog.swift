//
//  /InteropLibrary/ThingCatalog.swift
//  CxxInteropLibrary
//
//  Created by Carlyn Maw on 8/9/23.
//
import Foundation


public struct ThingCatalog {
    
    public init() {
    }
    
    //MARK: Misc C++ Function Tests
    public func sendAndReceiveString(send:String) -> String {
        return String(std.string(send))
    }
    
    //TODO: Non string C++ inits from inside XCode.
    //TODO: Find where can find current state o' affairs
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
    }
    
}
