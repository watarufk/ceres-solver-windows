call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64
echo on



SET SdksFolderPath=C:/SDKs



REM If you use MKL, set the install folder path (ex. "C:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows\mkl") to environment variable "MKLROOT".
REM About details, please refer to ../eigen-eigen-5a0156e40feb/cmake/FindBLAS.cmake



del "Eigen3_*.txt"
cd ..
rmdir /S /Q eigen-eigen-5a0156e40feb_build_x64
mkdir eigen-eigen-5a0156e40feb_build_x64
cd eigen-eigen-5a0156e40feb_build_x64



REM eigen is header library.  If BUILD_TESTING it not TRUE, cmake does not generate the project files.
cmake.exe ../eigen-eigen-5a0156e40feb -G "Visual Studio 14 2015 Win64" ^
-DEIGEN_TEST_CUDA:BOOL=TRUE ^
-DEIGEN_TEST_OPENMP:BOOL=TRUE ^
-DBoost_INCLUDE_DIR:PATH="%SdksFolderPath%/boost_1_64_0" ^
-DBUILD_TESTING:BOOL=TRUE ^
-DCMAKE_CONFIGURATION_TYPES:STRING="Release" ^
-DCMAKE_INSTALL_PREFIX:PATH="%SdksFolderPath%/eigen/eigen3" >> "..\ceres-solver-windows\Eigen3_cmake.txt" 2>&1

echo ^
-DEIGEN_CUDA_COMPUTE_ARCH:STRING="30" ^
-DGLUT_INCLUDE_DIR:PATH="%SdksFolderPath%/OpenGL/include" ^
-DGLUT_glut_LIBRARY:FILEPATH="%SdksFolderPath%/OpenGL/lib/x64/freeglut.lib" ^
-DGLEW_INCLUDE_DIR:PATH="%SdksFolderPath%/OpenGL/include" ^
-DGLEW_GLEW_LIBRARY:FILEPATH="%SdksFolderPath%/OpenGL/lib/x64/glew64.lib" ^
 

REM msbuild Eigen3.sln /m >> "..\ceres-solver-windows\Eigen3_msbuild.txt" 2>&1
REM cmake.exe --build "." --target "RUN_TESTS" --config "Release" >> "..\ceres-solver-windows\Eigen3_RunTestsRelease.txt" 2>&1

cmake.exe --build "." --target "INSTALL" --config "Release" >> "..\ceres-solver-windows\Eigen3_Install.txt" 2>&1



cd /d "%~dp0"
