//
//  PrimeNumberGenerator.cpp
//  
//
//  Created by Carlyn Maw on 8/13/23.
//

#include "PrimeNumberGenerator.hpp"

#include <fstream>
#include <random>
#include <string>


std::string BundleManager::path_for_resource(std::string name, std::string extension) {
    //TODO: In real code actually verify exists before just giving it back.
    return bundle_path + this_bundle_name + "/" + name + "." + extension;
}

int PrimeNumberGenerator::readNthLine(std::ifstream &in, int index) {
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
}

uint8_t PrimeNumberGenerator::random_uint8(const uint8_t &min, const uint8_t &max) {
    return fancy_random(min, max);
}

// just because.
// https://stackoverflow.com/questions/5008804/generating-a-random-integer-from-a-range
template <typename T> T PrimeNumberGenerator::fancy_random(const T &min, const T &max) {
    std::random_device seed_maker;
    std::mt19937 generator(
        seed_maker()); // Random-number engine to use (Mersenne-Twister)
    std::uniform_int_distribution<T> distribution(min,
                                                  max); // Guaranteed unbiased
    return distribution(generator);
}

// random prime within first 10000 primes
int PrimeNumberGenerator::random_prime() { return prime_at(fancy_random(0, 10000)); }

// prime in first 10000 primes at index
int PrimeNumberGenerator::prime_at(int index) {
    //assumes package uses .process for resources
    std::ifstream primesFile(bundle.path_for_resource("b000040", "txt"));
    if (primesFile.is_open()) {
        return readNthLine(primesFile, index);
    } else {
        // handle error
        return -1;
    }
}
