//
//  MultiFileExample/PrimeLib.cpp
//  
//
//  Created by Carlyn Maw on 8/7/23.
//
#include "PrimeLib.hpp"
#include <fstream>
#include <random>
#include <string>

// Max line is 12 characters long
const int max_line_length = 16;
// 10,000th prime is 104729
const int max_prime_length = 6;

int readNthLine(std::ifstream &in, int index) {
    for (int i = 0; i < index - 1; ++i) {
        // if don't know max line length
        //  in.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        in.ignore(max_line_length, '\n');
    }
    // What about a char *p instead of string?
    // Why/Why not do that in "Modern C++"
    std::string s;
    s.reserve(max_prime_length);
    std::getline(in.ignore(max_line_length, ' '), s);
    return std::stoi(s);
};

// just because.
// https://stackoverflow.com/questions/5008804/generating-a-random-integer-from-a-range
template <typename T> T fancy_random(const T &min, const T &max) {
    std::random_device seed_maker;
    std::mt19937 generator(
        seed_maker()); // Random-number engine to use (Mersenne-Twister)
    std::uniform_int_distribution<T> distribution(min,
                                                  max); // Guaranteed unbiased
    return distribution(generator);
}

// random prime within first 10000 primes
int random_prime() { return prime_at(fancy_random(0, 10000)); }

// prime in first 10000 primes at index
int prime_at(int index) {
    std::ifstream primesFile("resources/b000040.txt");
    if (primesFile.is_open()) {
        return readNthLine(primesFile, index);
    } else {
        // handle error
        return -1;
    }
}