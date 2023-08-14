//
//  PrimeNumberGenerator.hpp
//
//
//  Created by Carlyn Maw on 8/13/23.
//

#ifndef PrimeNumberGenerator_hpp
#define PrimeNumberGenerator_hpp

#include <stdio.h>
#include <string>
#include <swift/bridging> //allows for annotating

//Class standing in for NSBundle for now. The PNG is designed to 
//load a file from the bundle. 
class BundleManager {
public:
    BundleManager(std::string path, std::string name) {
        bundle_path = path;
        this_bundle_name = name;
    }
    
    std::string path() const SWIFT_COMPUTED_PROPERTY {
        return bundle_path;
    }
    
    std::string name() const SWIFT_COMPUTED_PROPERTY {
        return this_bundle_name;
    }
    
    std::string path_for_resource(std::string name, std::string extension);
    
private:
    std::string bundle_path;
    std::string this_bundle_name;
};


//Basic prime number supplier. Written as an object so each method call 
//doesn't need to be given a Bundle path location by the Swift. Annotated to 
//be a reference type mostly because I wanted the practice. 

class PrimeNumberGenerator {
public:
    PrimeNumberGenerator(std::string bundle_path)
    :bundle(bundle_path, "CxxInteropLibrary_cxxLibrary.bundle"), 
    max_line_length(16), // Max line is 12 characters long
    max_prime_length(6)  //// 10,000th prime is 104729
    {
    }
    
    //prime in first 10000 primes at index
    int prime_at(int index);
    
    //random prime within first 10000 primes
    int random_prime();
    
    //TODO:
    //- prime in range
    //- prime in listOfPrimes
    //- what would be a good practice for an iterator?
    
private:
    //All for file loading. 
    BundleManager bundle;
    const int max_line_length;     
    const int max_prime_length;     
    int readNthLine(std::ifstream &in, int index);
    
    template <typename T> T fancy_random(const T &min, const T &max);
    unsigned char random_uint8(const unsigned char &min, const unsigned char &max);
    
}; SWIFT_SHARED_REFERENCE(pngRetain,pngRelease);

void pngRetain(PrimeNumberGenerator *);
void pngRelease(PrimeNumberGenerator *);
//TODO: Clarify the different use case  seen in example code. 
//void pngRetain(PrimeNumberGenerator * _Nonnull forest);
//void pngRelease(PrimeNumberGenerator* _Nonnull forest);


#endif /* PrimeNumberGenerator_hpp */
