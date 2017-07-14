call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64
echo on



cd ..
rmdir /S /Q eigen-eigen-5a0156e40feb_build_x64
mkdir eigen-eigen-5a0156e40feb_build_x64
cd eigen-eigen-5a0156e40feb_build_x64



REM eigen is header library.  BUILD_TESTING must be TRUE.
cmake.exe ../eigen-eigen-5a0156e40feb -G "Visual Studio 14 2015 Win64" ^
-DCMAKE_CONFIGURATION_TYPES:STRING="Release" ^
-DCMAKE_SUPPRESS_REGENERATION:BOOL=TRUE ^
-DBUILD_TESTING:BOOL="1"

echo ^
-DCMAKE_CONFIGURATION_TYPES:STRING="Debug" ^
-DEIGEN_CUDA_COMPUTE_ARCH:STRING="30" ^
-DEIGEN_TEST_CUDA:BOOL="1" ^
-DEIGEN_TEST_OPENMP:BOOL="1" ^
-DBoost_INCLUDE_DIR:PATH="C:\SDKs\boost_1_64_0" ^
-DGLUT_INCLUDE_DIR:PATH="C:\SDKs\OpenGL\include" ^
-DGLUT_glut_LIBRARY:FILEPATH="C:\SDKs\OpenGL\lib\x64\freeglut.lib" ^
-DGLEW_INCLUDE_DIR:PATH="C:\SDKs\OpenGL\include" ^
-DGLEW_GLEW_LIBRARY:FILEPATH="C:\SDKs\OpenGL\lib\x64\glew64.lib" ^
 



msbuild Eigen3.sln /m
msbuild RUN_TESTS.vcxproj



cd ..\ceres-solver-windows
