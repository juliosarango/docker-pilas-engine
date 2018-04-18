FROM ubuntu:14.04
MAINTAINER 'Julio Sarango jsarangoq@gmail.com'
RUN apt-get -y update && \
apt-get -y install python-setuptools python-qt4 python-qt4-gl git-core python-qt4-phonon build-essential python-dev swig subversion python-pygame && \
easy_install -U box2d && \
#Agregamos repositorios
echo "deb http://archive.ubuntu.com/ubuntu/ xenial universe" >> /etc/apt/sources.list && \
echo "deb http://archive.ubuntu.com/ubuntu/ xenial-updates universe" >> /etc/apt/sources.list && \
#actualizamos nuevamente
apt-get -y update && \
apt-get install -y python-qt4=4.11.4+dfsg-1build4 python-qt4-gl=4.11.4+dfsg-1build4 python-qt4-phonon=4.11.4+dfsg-1build4 && \
apt-mark hold python-qt4 python-qt4-gl python-qt4-phonon && \
#clonamos el repositorio
git clone http://github.com/hugoruscitti/pilas
WORKDIR pilas
RUN python setup.py build && \
python setup.py install
#volvermos a la raíz para nuevamente clonar el repositorio
WORKDIR /
RUN git clone https://github.com/pybox2d/pybox2d -b 2.3.1
WORKDIR pybox2d
RUN python setup.py build && \
python setup.py install
#Ejecutamos el comando pilasengine
CMD pilasengine 
