FROM debian:jessie

MAINTAINER Kalemena

RUN apt-get clean; \
  apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get install --yes \
    texlive \
    texlive-latex-base \
    texlive-xetex \
    latex-xcolor \
    texlive-latex-extra \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-bibtex-extra \
    fontconfig \
    git \
    wget \
    tar \
    xz-utils; \
  apt-get clean; rm -rf /var/lib/apt/lists/*

RUN wget -O pandoc.deb https://github.com/jgm/pandoc/releases/download/1.19.2.1/pandoc-1.19.2.1-1-amd64.deb; \
  dpkg --install pandoc.deb; \
  rm pandoc.deb

WORKDIR /docs

ENTRYPOINT [ "/usr/bin/pandoc" ]
CMD ["--help"]