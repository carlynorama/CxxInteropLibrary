//
//  /moarcxx/main.swift
//  CxxInteropLibrary
//
//  Created by Carlyn Maw on 8/9/23.
//

import Foundation
import InteropLibrary

var catalog = ThingCatalog()

print(catalog.sendAndReceiveString(send: "hello"))
