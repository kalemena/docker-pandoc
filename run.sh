#!/bin/bash

# Find all Markdown files
MDFILES=$(find /docs -regex '.*\.\(md\|markdown\)')

cd /docs

if [ -n "$MDFILES" ]; then
    echo "Converting $MDFILES"
    pandoc -S -o docs.pdf --latex-engine=xelatex -f markdown_github --toc --top-level-division=chapter $MDFILES
else
    echo "No Markdown files found. Exiting."
fi