# docker-pilas-engine
Imagen docker con pilas-engine, sobre una imagen de ubuntu 14.04

Imagen construida según las indicaciones de [https://github.com/hugoruscitti/pilas/wiki/instalacion]


Para crear una instancia, ejecutar:
```
docker run -d \
--env="DISPLAY" \
--env="QT_X11_NO_MITSHM=1" \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
jsarangoq/pilas-engine
```
