call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64
echo on



cd ..
rmdir /S /Q eigen-eigen-5a0156e40feb_build_x64
mkdir eigen-eigen-5a0156e40feb_build_x64
cd eigen-eigen-5a0156e40feb_build_x64



REM eigen is header library.  BUILD_TESTING must be TRUE.
cmake.exe ../eigen-eigen-5a0156e40feb -G "Visual Studio 14 2015 Win64" ^
-DCMAKE_CONFIGURATION_TYPES:STRING="Debug;Release" ^
-DCMAKE_SUPPRESS_REGENERATION:BOOL=TRUE ^
-DBUILD_TESTING:BOOL="1"

echo ^
-DEIGEN_CUDA_COMPUTE_ARCH:STRING="30" ^
-DEIGEN_TEST_CUDA:BOOL="1" ^
-DGLUT_INCLUDE_DIR:PATH="C:\SDKs\OpenGL\include" ^
-DGLUT_glut_LIBRARY:FILEPATH="C:\SDKs\OpenGL\lib\x64\freeglut.lib" ^
-DGLEW_INCLUDE_DIR:PATH="C:\SDKs\OpenGL\include" ^
-DGLEW_GLEW_LIBRARY:FILEPATH="C:\SDKs\OpenGL\lib\x64\glew64.lib" ^
-DEIGEN_TEST_OPENMP:BOOL="1" ^
-DBoost_INCLUDE_DIR:PATH="C:\SDKs\boost_1_64_0" ^
 



msbuild Eigen3.sln /m
cmake.exe --build "." --target "RUN_TESTS" --config "Release" >> RUN_TESTS_Release_result.txt
cmake.exe --build "." --target "RUN_TESTS" --config "Debug" >> RUN_TESTS_Debug_result.txt



cd ..\ceres-solver-windows
