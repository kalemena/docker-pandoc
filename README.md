# docker-pandoc

Pandoc docker image.

Used to convert documentation between formats.

# How-To

## Run

### Converting to HTML

> docker run --rm -it -v $(pwd):/work kalemena/pandoc -o readme.html readme.md

### Converting to PDF

> docker run --rm -it -v $(pwd):/work kalemena/pandoc -o readme.pdf readme.md

### Converting to PDF (github-like)

> docker run --rm -it -v $(pwd):/work kalemena/pandoc -S -o readme.pdf --latex-engine=xelatex -f markdown_github -toc readme.md ?-*.md

## Build

> docker build -t kalemena/pandoc .

## References

* http://pandoc.org/demos.html
