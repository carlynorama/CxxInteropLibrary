//
//  /moarcxx/main.swift
//  CxxInteropLibrary
//
//  Created by Carlyn Maw on 8/9/23.
//

import Foundation
import InteropLibrary

var catalog = ThingCatalog()

for _ in 0..<catalog.currentNumber() {
    print("\(catalog.currentWord())")
}

let result = catalog.openAndPrintATestFile("README.md")
//vs.
//let result = catalog.openAndPrintATestFile("file:///Users/my_user/..../README.md")
print(result)

print(catalog.getTheCWD())
