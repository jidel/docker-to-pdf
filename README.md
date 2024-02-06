# Docker toPDF

Converts documents to PDF using libreoffice running in a Docker container without the need to install libreoffice and its dependencies on your host system.
Uses the UNIX way of reading from `stdin` and outputting to `stdout`, so no volume mounting is needed.

## Getting Started

### Prerequisites

You need to have docker installed on your system. For instructions on how to install, see here:

- [Windows](https://docs.docker.com/windows/started)
- [OS X](https://docs.docker.com/mac/started/)
- [Linux](https://docs.docker.com/linux/started/)

### Install

Image is not yet published to Dockerhub yet, you have to build it locally:

```sh
$ docker build -t doctopdf .
```

### Usage

Using the `--rm` flag ensures that the container is removed after use and does not clutter your docker with unused containers.

```sh
$ docker run --rm -i doctopdf < Document.docx > Document.pdf
```

Alternatively, you could use the `cat` command to pipe the input file into the container:

```sh
$ cat Document.docx | docker run --rm -i doctopdf > Document.pdf
```

### Custom Fonts

The image comes with the default debian fonts as well as the non-default Microsoft fonts like `Arial` or `Times New Roman` by installing the `ttf-mscorefonts-installer` package.

Additional TrueType fonts can be placed into the [fonts](./fonts) folder. They are copied into the image on build and can then be used in the PDF creation process.

## Acknowledgments

Thanks go to [Vlad Hulobiev](https://github.com/vladholubiev) as the idea is heavily based on his [work](https://github.com/vladholubiev/docker-libreoffice-pdf-cli/tree/master).
