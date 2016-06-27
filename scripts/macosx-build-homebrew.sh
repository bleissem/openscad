#!/bin/sh -e
#
# This script builds  library dependencies of OpenSCAD for Mac OS X using Homebrew.
# 
# This script must be run from the OpenSCAD source root directory
#
# Prerequisites:
# - Homebrew (http://brew.sh)
#

OPENSCADDIR=$PWD

printUsage()
{
  echo "Usage: $0"
}

if [ ! -f $OPENSCADDIR/openscad.pro ]; then
  echo "Must be run from the OpenSCAD source root directory"
  exit 0
fi

brew tap openscad/tap
brew tap glehmann/homebrew-extras
brew unlink boost
for formula in qt5 qscintilla2-qt5 eigen boost cgal glew glib opencsg freetype libxml2 fontconfig harfbuzz; do
  brew install $formula
done
brew link --force qt5
brew link --force qscintilla2-qt5

