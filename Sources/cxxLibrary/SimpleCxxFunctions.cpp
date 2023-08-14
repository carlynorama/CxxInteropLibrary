//
//  SimpleCxxFunctions.cpp
//  CxxInteropLibrary
//
//  Created by Carlyn Maw on 8/9/23.
//

//This is all red squiggly underlined in VSCode until add include to 
//header include path in vscode settings.
// "includePath": [
//     "${workspaceFolder}/**",
//     "${workspaceFolder}/Sources/cxxLibrary/include"
// ],
#include "SimpleCxxFunctions.hpp" 

#include <string>
#include <iostream>
#include <fstream>
#include <random>
#include <unistd.h>

//------------------------------------------------------------------------- Ints
int my_favorite_number() {
    return 5;
}

template <typename T> T fancy_random(const T &min, const T &max) {
   std::random_device seed_maker;
   std::mt19937 generator(seed_maker()); // Random-number engine to use (Mersenne-Twister)
   std::uniform_int_distribution<T> distribution(min,
                                                 max); // Guaranteed unbiased
   return distribution(generator);
}

uint8_t random_uint8(const uint8_t &min, const uint8_t &max) {
   return fancy_random(min, max);
}


//---------------------------------------------------------------------- Strings
std::string my_favorite_word() {
    return "melodious";
}

std::string echo_this(std::string yodel) {
    return yodel;
    //return 1
}


//------------------------------------------------------------ System and FileIO
int cppTestFileRead(std::string path) {
    std::string line;
    std::ifstream rfile;
    rfile.open(path);
    if (rfile.is_open()) {
        while (std::getline(rfile, line)) {
            std::cout << line << std::endl;
        }
        rfile.close();
    } else {
        return -1;
    }
    return 0;
}

//No windows FWIW. 
std::string getCurrentWorkingDir() {
  char buff[FILENAME_MAX];
  getcwd( buff, FILENAME_MAX );
  std::string current_working_dir(buff);
  return current_working_dir;
}