# docker-pandoc

[![Build Status](https://travis-ci.org/kalemena/docker-pandoc.svg?branch=master)](https://travis-ci.org/kalemena/docker-pandoc)
[![Docker Version](https://images.microbadger.com/badges/version/kalemena/pandoc.svg)](https://microbadger.com/images/kalemena/pandoc)
[![Docker Hub](https://images.microbadger.com/badges/image/kalemena/pandoc.svg)](https://hub.docker.com/r/kalemena/pandoc/tags)

Pandoc docker image.

Used to convert documentation between formats.

# How-To

## Run

### Converting to HTML

```bash
> docker run --rm -it -v $(pwd):/docs kalemena/pandoc -o readme.html readme.md
```

### Converting to PDF

```bash
> docker run --rm -it -v $(pwd):/docs kalemena/pandoc -o readme.pdf readme.md
```

### Converting to PDF (github-like)

```bash
> docker run --rm -it -v $(pwd):/docs kalemena/pandoc -o readme.pdf -S --latex-engine=xelatex -f markdown_github --toc --top-level-division=chapter readme.md ?-*.md
```
or
```bash
> docker run --rm -it -v $(pwd):/docs kalemena/pandoc -o readme.pdf -s -S -r markdown+simple_tables+table_captions+yaml_metadata_block --latex-engine=pdflatex -f markdown_github --toc readme.md ?-*.md
```

## Build

```bash
> docker build -t kalemena/pandoc .
```

## References

* [Pandoc demo](http://pandoc.org/demos.html)
* [Pandoc Manual](http://pandoc.org/MANUAL.html)
* [Pandoc-Extras](https://github.com/jgm/pandoc/wiki/Pandoc-Extras)

