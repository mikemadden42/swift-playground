# swift-playground

Sample Swift programs

![Powered by MacStadium](https://uploads-ssl.webflow.com/5ac3c046c82724970fc60918/5c019d917bba312af7553b49_MacStadium-developerlogo.png)

Thanks [MacStadium](https://www.macstadium.com/opensource) for supporting the FOSS community by offering FREE hosting for developers working on open source projects.

The easiest way to build this project is with `make`. On macOS it builds universal (x86_64 + arm64) binaries; on Linux it builds native binaries.

```bash
make
```

There is also support to build the project with `cmake`.

`cmake` support for Swift was added in version [3.15.0](https://cmake.org/cmake/help/latest/release/3.15.html?highlight=swift).

Inspiration for building with `cmake` originated from this [project](https://github.com/compnerd/swift-build-examples).

```bash
mkdir build; cd build; cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..; ninja --verbose; strip Countdown Lookup cores hello launch newpass sysinfo
```
