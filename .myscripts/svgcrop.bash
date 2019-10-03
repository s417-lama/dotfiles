#!/bin/bash
set -euo pipefail
export LC_ALL=C
export LANG=C

FILE_SVG=$1
FILE_PDF=${FILE_SVG}_svgcrop.pdf
FILE_CROPPED=${FILE_SVG}_svgcropped.pdf

cairosvg $FILE_SVG -o $FILE_PDF
pdfcrop $FILE_PDF $FILE_CROPPED
pdf2svg $FILE_CROPPED $FILE_SVG
rm $FILE_PDF $FILE_CROPPED
