SET SdksFolderPath=C:/SDKs



cd ..
rmdir /S /Q ceres-solver_build_x64
mkdir ceres-solver_build_x64



cd ceres-solver_build_x64
cmake.exe ../ceres-solver -G "Visual Studio 14 2015 Win64" ^
-DEigen3_DIR:PATH="%SdksFolderPath%/eigen/eigen3/share/eigen3/cmake" ^
-DEIGEN_INCLUDE_DIR:PATH="%SdksFolderPath%/eigen/eigen3/include/eigen3" ^
-DEIGEN3_INCLUDE_DIR:PATH="%SdksFolderPath%/eigen/eigen3/include/eigen3" ^
-Dgflags_DIR:PATH="%SdksFolderPath%/gflags/gflags/lib/cmake/gflags" ^
-DGFLAGS_INCLUDE_DIR:PATH="%SdksFolderPath%/gflags/gflags/include" ^
-DGFLAGS_LIBRARY:FILEPATH="%SdksFolderPath%/gflags/gflags/lib/gflags_nothreads_static.lib" ^
-DGFLAGS_NAMESPACE=google ^
-Dglog_DIR:PATH="%SdksFolderPath%/google/glog/lib/cmake/glog" ^
-DGLOG_INCLUDE_DIR:PATH="%SdksFolderPath%/google/glog/include" ^
-DGLOG_LIBRARY:FILEPATH="%SdksFolderPath%/google/glog/lib/glog.lib" ^
-DEIGENSPARSE:BOOL=TRUE ^
-DGFLAGS:BOOL=TRUE ^
-DOPENMP:BOOL=TRUE ^
-DCUSTOM_BLAS:BOOL=TRUE ^
-DEXPORT_BUILD_DIR:BOOL=TRUE ^
-DCMAKE_INSTALL_PREFIX:PATH="%SdksFolderPath%/ceres-solver/ceres-solver"

cmake.exe --build "." --target "ALL_BUILD" --config "Release"
REM cmake.exe --build "." --target "RUN_TESTS" --config "Release"
cmake.exe --build "." --target "INSTALL" --config "Release"
cd ..



cd /d "%~dp0"
