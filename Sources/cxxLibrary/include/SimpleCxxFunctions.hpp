//
//  SimpleCxxFunctions.hpp
//  CppInteropLibrary
//  Created by Carlyn Maw on 8/9/23.
//

#ifndef SimpleCxxFunctions_hpp
#define SimpleCxxFunctions_hpp

#include <stdio.h>
#include <string>

//------------------------------------------------------------------------ INTs
int my_favorite_number();

//--- Stand Alone Random Number
template <typename T> T fancy_random(const T &min, const T &max);
unsigned char random_uint8(const unsigned char &min, const unsigned char &max);

//---------------------------------------------------------------------- Strings
std::string echo_this(std::string yodel);
std::string my_favorite_word();

//------------------------------------------------------------ System and FileIO
int cppTestFileRead(std::string path);
std::string getCurrentWorkingDir();

#endif /* SimpleCxxFunctions_hpp */
