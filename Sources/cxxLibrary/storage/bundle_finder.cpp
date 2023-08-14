//#include "bundle_finder.hpp"
//
//
//// std::string path_for_resource(std::string name, std::string extension) {
////     //this is what i want to use: https://github.com/apple/swift-package-manager/blob/48192bbdd2800a38a82fa658a244e70b3167ec5d/Sources/Build/BuildDescription/ClangTargetBuildDescription.swift#L304-L364
////     // see also https://forums.swift.org/t/access-a-package-s-bundle-module-from-c-c/63339
//// //    NSString *objcName = [NSString stringWithCString:name.c_str() encoding:NSASCIIStringEncoding];
//// //    NSString *objcExtension = [NSString stringWithCString:extension.c_str() encoding:NSASCIIStringEncoding];
//// //    NSString *objcPath = [SWIFTPM_MODULE_BUNDLE pathForResource:objcName ofType:objcExtension];
//// //
//// //    return std::string([objcPath cStringUsingEncoding:NSASCIIStringEncoding]);
////     //int bundle = SWIFTPM_MODULE_BUNDLE
////     return "some/path";
//// }
//
//
//std::string BundleManager::path_for_resource(std::string name, std::string extension) {
//    //TODO: In real code actually verify exists before just giving it back. 
//    return bundle_path + "/" + this_bundle_name + "/" + name + "." + extension;
//}
