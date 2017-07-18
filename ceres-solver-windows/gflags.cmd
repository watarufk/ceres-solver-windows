SET SdksFolderPath=C:/SDKs



cd ..
rmdir /S /Q gflags_build_x64
mkdir gflags_build_x64



cd gflags_build_x64
cmake.exe ../gflags -G "Visual Studio 14 2015 Win64" ^
-DBUILD_STATIC_LIBS:BOOL=TRUE ^
-DINSTALL_SHARED_LIBS:BOOL=FALSE ^
-DBUILD_TESTING:BOOL=TRUE ^
-DCMAKE_INSTALL_PREFIX:PATH="%SdksFolderPath%/gflags/gflags"

cmake.exe --build "." --target "ALL_BUILD" --config "Release"
cmake.exe --build "." --target "RUN_TESTS" --config "Release"
cmake.exe --build "." --target "INSTALL" --config "Release"
cd ..



cd /d "%~dp0"
