//
//  /InteropLibrary/ThingCatalog.swift
//  CxxInteropLibrary
//
//  Created by Carlyn Maw on 8/9/23.
//
import cxxLibrary

public struct ThingCatalog {
    public init() {}
    public func currentNumber() -> Int {
        return Int(myFavoriteNumber())
    }
    
    public func currentWord() -> String {
        return String(myFavoriteWord())
    }
}
