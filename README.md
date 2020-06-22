# swift-playground

Sample Swift programs

The easiest way to build this project is to use the provided `build.sh` script.

```bash
./buid.sh
```

There is also support to build the project with `cmake`.

`cmake` support for Swift was added in version [3.15.0](https://cmake.org/cmake/help/latest/release/3.15.html?highlight=swift).

Inspiration for building with `cmake` originated from this [project](https://github.com/compnerd/swift-build-examples).

```bash
mkdir build; cd build; cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..; ninja --verbose; strip hello sysinfo Chapter01
```
