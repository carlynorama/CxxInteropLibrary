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
        return Int(my_favorite_number())
    }
    
    public func currentWord() -> String {
        return String(my_favorite_word())
    }
}
