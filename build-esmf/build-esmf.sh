#!/usr/bin/env bash

source ./build-esmf-env.sh

# ESMF -----------------------------------------------------------------------------------------------------------------

cd ${ESMF_DIR}
make info | tee ${BE_OUT_DIR}/esmf-make-info.out && \
make distclean && \
make -j ${CPU_COUNT} | tee ${BE_OUT_DIR}/esmf-make.out # &&

#make clean
#make doc | tee ${BE_OUT_DIR}/esmf-make-doc.out # && \
#make all_tests | tee ${BE_OUT_DIR}/esmf-all-tests.out && \
#make check | tee ${BE_OUT_DIR}/esmf-make-check.out # && \
#make install | tee ${BE_OUT_DIR}/esmf-make-install.out

# ESMPy ----------------------------------------------------------------------------------------------------------------

cd ${ESMF_DIR}
export WD=`pwd -LP`
export ESMFMKFILE=`find ${WD} -name '*esmf.mk'`
echo "ESMF Make File: ${ESMFMKFILE}"
cd ${ESMF_DIR}/src/addon/ESMPy && rm -rf build
python setup.py build --ESMFMKFILE=${ESMFMKFILE}
python setup.py install
