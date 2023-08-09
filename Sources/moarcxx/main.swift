//
//  File.swift
//  
//
//  Created by Labtanza on 8/9/23.
//

import Foundation
import InteropLibrary

let catalog = ThingCatalog()

for _ in 0..<catalog.currentNumber() {
    print("\(catalog.currentWord())")
}

