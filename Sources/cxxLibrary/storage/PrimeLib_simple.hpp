//
//  MultiFileExample/PrimeLib.hpp
//  
//
//  Created by Carlyn Maw on 8/7/23.
//
#ifndef PRIME_INCLUDED
#define PRIME_INCLUDED

#include "bundle_finder.hpp"

//prime in first 10000 primes at index
int prime_at(int index);
//random prime within first 10000 primes
int random_prime();

int special_number();

template <typename T> T fancy_random(const T &min, const T &max);
unsigned char random_uint8(const unsigned char &min, const unsigned char &max);

#endif
