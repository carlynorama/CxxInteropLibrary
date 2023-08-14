//
//  SimpleCxxFunctions.cpp
//  CxxInteropLibrary
//
//  Created by Carlyn Maw on 8/9/23.
//

#include "SimpleCxxFunctions.hpp"
#include <string>
#include <iostream>
#include <fstream>

#include <unistd.h>

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