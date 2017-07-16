# ceres-solver-windows

Some batch files and sub-modules to build ceres-solver on Windows.  
About ceres-solver, please refer to  
<http://ceres-solver.org/>  
<https://github.com/ceres-solver/ceres-solver>  
[NOTE] In some conditions, the CMake calling command fails to find Eigen3.  In such cases, move the Eigen3 folder to the other place.

## License
BSD-3-Clause (<https://github.com/kishimoto-exvision/ceres-solver-windows/blob/master/LICENSE>)  
[NOTE] Enabling the use of Eigen as a sparse linear algebra library for solving the nonlinear least squares problems.  Enabling this option results in an LGPL licensed version of Ceres Solver as the Simplicial Cholesky factorization in Eigen is licensed under the LGPL.  

## Third Party Libraries
* ceres-solver (BSD-3-Clause) (<https://github.com/ceres-solver/ceres-solver/blob/master/LICENSE>)
* gflags (BSD-3-Clause) (<https://github.com/gflags/gflags/blob/master/COPYING.txt>)
* glog (BSD-3-Clause) (<https://github.com/google/glog/blob/master/COPYING>)
* Eigen3 (MPL2) (<https://www.mozilla.org/en-US/MPL/2.0/>)
