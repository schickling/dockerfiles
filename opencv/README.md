# opencv

Lightweight ready-to use OpenCV image

## Usage

```sh
$ docker run --rm -it -v $(pwd):/source schickling/opencv
```

### Compile

```sh
$ gcc $(pkg-config --cflags --libs opencv) -lstdc++ my-file.cpp
```
