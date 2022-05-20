FROM ubuntu:20.04

# Set timezone
RUN ln -s /usr/share/zoneinfo/Europe/London /etc/localtime
RUN "date"

RUN apt-get update
RUN apt-get install -y gfortran make git libnetcdff-dev libarpack2-dev libnetcdf-dev

# Set default WORKDIR
WORKDIR /root

COPY ./arpack .

RUN uncompress arpack96.tar.Z
RUN tar -xvf arpack96.tar
RUN uncompress patch.tar.Z
RUN tar -xvf patch.tar
RUN chmod 755 ./ARmake.inc
RUN cp ./ARmake.inc ./ARPACK/ARmake.inc

#build ARPACK
WORKDIR /root/ARPACK
RUN make lib 
# /root/ARPACK/libarpack_x86_64.a

#building DINEOF
WORKDIR /source
RUN git clone https://github.com/Aida-Alvera/DINEOF
WORKDIR /source/DINEOF
RUN cp config.mk.template config.mk
RUN make


WORKDIR /source


CMD ["bash"]
