## Fortran DINEOF

### for Ubuntu 20.04

### pc architecture x86_64

### fortran compiler: gfortran

1. Build Docker `docker build . -t fortarpack`
2. Run the container with a mapped volume `docker run -it -v $(pwd)/scripts:/source/scripts fortarpack /bin/bash`
3. the DINEOF make file is inside the folder `/source/DINEOF/`
4. the ARPACK lib is inside the folder `/root/ARPACK/`

## Preliminaries on the local machine ...

- A. The ARPACK web pages have info and instructions (https://www.caam.rice.edu/software/ARPACK/)
  - The new (May 2022) download page is... https://www.caam.rice.edu/software/ARPACK/
  - Go to line ARPACK, click on link "instruction.arpack" and follow instructions to download
    and unpack compressed files arpack96 and patch.
- B. After unpacking ...
  - ARmake.inc file must be edited before building the ARPACK library
  - For our platform architecture (x86_64) and operating system (Ubuntu 20.04), the following changes were made:
    - line PLAT changed to: PLAT = x86_64
    - line FFLAGS changed to: FFLAGS = -o
    - line MAKE changed to: MAKE = /usr/bin/make
- C. Make arpack library per ARPACK instructions
- D. Download and build DINEOF
  - Follow instructions in the README.md file at https://github.com/aida-alvera/DINEOF
- E. Follow instructions above to build and run in docker container on your local machine.
  - You need to have docker installed in your machine, you can use the docker install docs at https://docs.docker.com/engine/install/ or:
    - sudo apt install docker.io
    - sudo usermod -aG docker ${USER}
    - sudo service docker restart
    - restart the terminal
