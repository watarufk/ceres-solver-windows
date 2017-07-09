cd ..



mkdir gflags_build_x64
mkdir glog_build_x64
mkdir ceres-solver_build_x64



cd gflags_build_x64
cmake.exe ../gflags -G "Visual Studio 14 2015 Win64" -DCMAKE_SUPPRESS_REGENERATION:BOOL=TRUE -DBUILD_TESTING:BOOL=TRUE
cmake.exe --build "." --target "ALL_BUILD" --config "Release"
cd ..



cd glog_build_x64
cmake.exe ../glog -G "Visual Studio 14 2015 Win64" -DCMAKE_SUPPRESS_REGENERATION:BOOL=TRUE
cmake.exe --build "." --target "ALL_BUILD" --config "Release"
cd ..



cd ceres-solver_build_x64
cmake.exe ../ceres-solver -G "Visual Studio 14 2015 Win64" -DCMAKE_SUPPRESS_REGENERATION:BOOL=TRUE -DEIGENSPARSE:BOOL=TRUE -DEIGEN_INCLUDE_DIR=../eigen-eigen-5a0156e40feb -DGFLAGS:BOOL=TRUE -DGFLAGS_INCLUDE_DIR=../gflags_build_x64/include -DGFLAGS_LIBRARY=../gflags_build_x64/lib/Release/gflags_static.lib
cmake.exe --build "." --target "ALL_BUILD" --config "Release"
cd ..



cd ceres-solver-windows
