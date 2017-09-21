# ``build-esmf`` README

It is recommended that this build script be used with an Anaconda environment. Installing `gcc` is recommended to synchronize the compilers with the libraries builr on `conda-forge`.

```
conda create -n esmf-py3 -c nesii/channel/dev-esmf -c conda-forge esmpy python=3 gcc
```

Basic usage:
1. Modify any environment variables in `build-esmf-env.sh`.
2. Execute the `build-esmf.sh` script. You can customize the build steps by commenting in this file.

