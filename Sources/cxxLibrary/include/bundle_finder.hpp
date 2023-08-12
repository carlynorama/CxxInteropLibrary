#include <string>
#include <swift/bridging> //Adds the ability to as teh keywords

//will know I have the right thing in the header 
//when the below works? See minute 6:59 in Mix Swift WWDC Video
//swift::String test_string_import;



class BundleManager {

public:
    //std::string path_for_resource(std::string name, std::string extension);

    std::string getPath() const SWIFT_COMPUTED_PROPERTY {
        return bundle_path;
    }

private:
    std::string bundle_path;
    //std::string this_bundle_name;
}

