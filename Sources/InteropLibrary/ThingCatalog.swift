//
//  /InteropLibrary/ThingCatalog.swift
//  CxxInteropLibrary
//
//  Created by Carlyn Maw on 8/9/23.
//
import Foundation
//import CxxStdlib

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
        print(x)
    }
    
}
