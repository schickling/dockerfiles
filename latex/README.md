# latex

Full texlive distribution

## Usage

```sh
$ docker run --rm -it -v $(pwd):/source schickling/latex
```

Mount your local source folder to the container and run it inside the container.

#### Compiling a latex document

```sh
$ pdflatex my-document.tex
```

#### Compiling a xetex document

```sh
$ xelatex my-document.xtx
```
