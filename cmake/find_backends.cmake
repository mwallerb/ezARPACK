message(STATUS "Detecting matrix algebra backends")

# Find Eigen3
find_package(Eigen3 3.3 CONFIG)
if(Eigen3_FOUND)
  message(STATUS "Found Eigen3 version ${Eigen3_VERSION}")
endif(Eigen3_FOUND)

# Find TRIQS
find_package(Cpp2Py CONFIG)
find_package(TRIQS CONFIG)
