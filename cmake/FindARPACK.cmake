# Copyright (C) 2016 Michael Danilov

SET(ARPACK_SEARCH_PATHS ${ARPACK_DIR})

FIND_LIBRARY(ARPACK_LIB NAMES arpack PATHS ${ARPACK_SEARCH_PATHS}/lib NO_DEFAULT_PATH)
FIND_LIBRARY(ARPACK_LIB NAMES arpack)

if(USE_MPI)
  FIND_LIBRARY(PARPACK_LIB NAMES parpack PATHS ${ARPACK_SEARCH_PATHS} NO_DEFAULT_PATH)
  FIND_LIBRARY(PARPACK_LIB NAMES parpack PATHS)
endif (USE_MPI)

SET(ARPACK_FOUND FALSE)
IF (ARPACK_LIB)
    SET(ARPACK_FOUND TRUE)
    IF (PARPACK_LIB)
        SET(PARPACK_FOUND TRUE)
        MARK_AS_ADVANCED(PARPACK_LIB)
    ENDIF (PARPACK_LIB)
    MARK_AS_ADVANCED(ARPACK_LIB)
ENDIF (ARPACK_LIB)

IF (ARPACK_FOUND)
    IF (NOT ARPACK_LIB_FIND_QUIETLY)
        MESSAGE(STATUS "Found ARPACK: ${ARPACK_LIB}")
        GET_FILENAME_COMPONENT(ARPACK_PATH ${ARPACK_LIB} PATH CACHE)
        SET(ARPACK_INCLUDE_DIR ${ARPACK_PATH}/../include CACHE FILEPATH "ARPACK include directory.")
    ENDIF (NOT ARPACK_LIB_FIND_QUIETLY)
ELSE(ARPACK_FOUND)
    IF (ARPACK_LIB_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find ARPACK")
    ENDIF (ARPACK_LIB_FIND_REQUIRED)
ENDIF (ARPACK_FOUND)