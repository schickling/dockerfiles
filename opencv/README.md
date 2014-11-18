# opencv

Lightweight ready-to use OpenCV image

## Usage

```sh
$ docker run --rm -it -v $(pwd):/source schickling/opencv
```

### Compile

```sh
$ g++ $(pkg-config --cflags --libs opencv) my-file.cpp
```
