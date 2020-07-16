FROM debian:jessie

MAINTAINER Kalemena

ARG PANDOC_VERSION=2.10

 # Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Kalemena Pandoc" \
      org.label-schema.description="Kalemena Pandoc" \
      org.label-schema.url="private" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/kalemena/docker-pandoc" \
      org.label-schema.vendor="Kalemena" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

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

RUN wget -O pandoc.deb https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb; \
  dpkg --install pandoc.deb; \
  rm pandoc.deb

WORKDIR /docs

ENTRYPOINT [ "/usr/bin/pandoc" ]
CMD ["--help"]