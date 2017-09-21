#!/usr/bin/env bash


export CONDA_ENV="esmf-py2.7"

export PREFIX=/home/sandbox/esmf-latest

export PREFIX_ENV=/home/user/anaconda2/envs/${CONDA_ENV}

export ESMF_DIR=/home/project/esmf

export CPU_COUNT=`nproc`

export WITH_NETCDF="true"
#export WITH_NETCDF="false"

#export WITH_PNETCDF="true"
export WITH_PNETCDF="false"

export BE_OUT_DIR=~/htmp

#export ESMF_COMPILER="intel"

# ESMF debugging option.
export ESMF_BOPT="g"

# ----------------------------------------------------------------------------------------------------------------------

source activate ${CONDA_ENV}

# Needed for mpich-v3 support if communicator option is not mpich3
#export ESMF_CXXLINKLIBS=-lmpifort

export ESMF_INSTALL_PREFIX=${PREFIX}
export ESMF_INSTALL_BINDIR=${PREFIX}/bin
export ESMF_INSTALL_DOCDIR=${PREFIX}/doc
export ESMF_INSTALL_HEADERDIR=${PREFIX}/include
export ESMF_INSTALL_LIBDIR=${PREFIX}/lib
export ESMF_INSTALL_MODDIR=${PREFIX}/modq

if [ ${WITH_NETCDF} == "true" ]; then
    export ESMF_NETCDF="split"
    export ESMF_NETCDF_INCLUDE=${PREFIX_ENV}/include
    export ESMF_NETCDF_LIBPATH=${PREFIX_ENV}/lib
else
    unset ESMF_NETCDF ESMF_NETCDF_INCLUDE ESMF_NETCDF_LIBPATH
fi

if [ ${WITH_PNETCDF} == "true" ]; then
    export ESMF_PNETCDF="standard"
    export ESMF_PNETCDF_INCLUDE=${PREFIX_ENV}/include
    export ESMF_PNETCDF_LIBPATH=${PREFIX_ENV}/lib
else
    unset ESMF_PNETCDF ESMF_PNETCDF_INCLUDE ESMF_PNETCDF_LIBPATH
fi

#export ESMF_COMM='mpich2'
export ESMF_COMM='mpich3'
