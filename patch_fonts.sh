#!/bin/bash
set -euo pipefail

PlemolJP_ver=1.7.1

mkdir -p fonts
cd fonts/

if [ ! -d PlemolJP_v${PlemolJP_ver} ]; then
  wget https://github.com/yuru7/PlemolJP/releases/download/v${PlemolJP_ver}/PlemolJP_v${PlemolJP_ver}.zip
  unzip PlemolJP_v${PlemolJP_ver}.zip
fi

mkdir -p out

if [ ! -d terminal-glyph-patcher ]; then
  git clone https://github.com/s417-lama/terminal-glyph-patcher.git
fi

cd terminal-glyph-patcher/
fontforge -script terminal-glyph-patcher.py ../PlemolJP_v${PlemolJP_ver}/PlemolJP/PlemolJP-Regular.ttf
fontforge -script terminal-glyph-patcher.py ../PlemolJP_v${PlemolJP_ver}/PlemolJP/PlemolJP-Bold.ttf
fontforge -script terminal-glyph-patcher.py ../PlemolJP_v${PlemolJP_ver}/PlemolJP/PlemolJP-Italic.ttf
fontforge -script terminal-glyph-patcher.py ../PlemolJP_v${PlemolJP_ver}/PlemolJP/PlemolJP-BoldItalic.ttf

mv PlemolJP* ../out/
