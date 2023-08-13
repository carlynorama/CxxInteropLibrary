# Package with Both C++ and Swift

This project is for testing C++ and Swift in the context of a library. 

- Apple Swift version 5.9 (swiftlang-5.9.0.128.2 clang-1500.0.40.1)
- XCode 15, beta 6

code can be run via either 

```zsh
swift test #or
#Not fully implemented# swift run moarcxx
```

## References

- https://developer.apple.com/videos/play/wwdc2023/10172/
- https://developer.apple.com/documentation/Swift/MixingLanguagesInAnXcodeProject 
- https://developer.apple.com/documentation/swift/callingapisacrosslanguageboundaries
- https://www.swift.org/documentation/cxx-interop/
- https://www.swift.org/documentation/cxx-interop/project-build-setup/


Trouble shooting Notes And Questions

-  Warning on `swift test`

```
Building for debugging...
ld: warning: object file (/Applications/Xcode-beta.app/Contents/Developer/Toolchains/
XcodeDefault.xctoolchain/usr/lib/swift/macosx/libswiftCxxStdlib.a[x86_64][2](CxxStdlib.o))
was built for newer 'macOS' version (13.0) than being linked (10.13)
```

- Is there an Apple recommended .clang-format

- Is a resources file in the C++ lib even worth trying to learn about?
    - .process -> .build/debug/CxxInteropLibrary_cxxLibrary.bundle/b000040.txt
    - .copy -> .build/debug/CxxInteropLibrary_cxxLibrary.bundle/resources/b000040.txt
    - see https://forums.swift.org/t/access-a-package-s-bundle-module-from-c-c/63339

- where does this line go, because it crashes compile `#include <SwiftLibrary-Swift.h>`

