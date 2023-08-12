//
//  SimpleCxxFunctions.cpp
//  CxxInteropLibrary
//
//  Created by Carlyn Maw on 8/9/23.
//

#include "SimpleCxxFunctions.hpp"
#include <string>
int my_favorite_number() {
    return 5;
}


std::string my_favorite_word() {
    return "melodious";
}

std::string echo_this(std::string yodel) {
    return yodel;
    //return 1
}


