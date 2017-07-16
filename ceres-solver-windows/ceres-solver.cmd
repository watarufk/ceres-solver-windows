cd ..
rmdir /S /Q ceres-solver_build_x64
mkdir ceres-solver_build_x64



cd ceres-solver_build_x64
cmake.exe ../ceres-solver -G "Visual Studio 14 2015 Win64" ^
-DEIGEN_INCLUDE_DIR:PATH="../eigen-eigen-5a0156e40feb" ^
-Dgflags_DIR:PATH="../gflags_build_x64" ^
-DGFLAGS_INCLUDE_DIR:PATH="../gflags_build_x64/include" ^
-DGFLAGS_LIBRARY:FILEPATH="../gflags_build_x64/lib/Release/gflags_nothreads_static.lib" ^
-DGFLAGS_NAMESPACE=google ^
-Dglog_DIR:PATH="../glog_build_x64" ^
-DGLOG_INCLUDE_DIR:PATH="../glog/src" ^
-DGLOG_LIBRARY:FILEPATH="../glog_build_x64/Release/glog.lib" ^
-DEIGENSPARSE:BOOL=TRUE ^
-DGFLAGS:BOOL=TRUE ^
-DOPENMP:BOOL=TRUE ^
-DCUSTOM_BLAS:BOOL=FALSE ^
-DEXPORT_BUILD_DIR:BOOL=TRUE

REM DO NOT ADD -DEigen3_DIR:PATH="../eigen-eigen-5a0156e40feb_build_x64" ^
REM NO MEANING: -DEigen_DIR:PATH="../eigen-eigen-5a0156e40feb_build_x64" ^

cmake.exe --build "." --target "ALL_BUILD" --config "Release"
cmake.exe --build "." --target "RUN_TESTS" --config "Release"
cd ..



cd ceres-solver-windows
