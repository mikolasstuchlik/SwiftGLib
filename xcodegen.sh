#!/bin/sh
#
# Script to generate an Xcode project using the Swift package manager.
# The generated project gets patched to configure the header search paths
# and pass them to subprojects, based on the configured -I flags.
#
. ./config.sh
./package.sh generate-xcodeproj "$@"
( cd GLib.xcodeproj/Configs						&& \
  mv Project.xcconfig Project.xcconfig.in				&& \
  sed -e 's/ -I ?[^ ]*//g' < Project.xcconfig.in > Project.xcconfig	&& \
  grep 'OTHER_CFLAGS' < Project.xcconfig.in | sed 's/-I */-I/g'		|  \
    tr ' ' '\n' | grep -- -I | tr '\n' ' '				|  \
    sed -e 's/^/HEADER_SEARCH_PATHS = /' -e 's/ -I/ /g' >> Project.xcconfig
)
( cd GLib.xcodeproj							&& \
  mv project.pbxproj project.pbxproj.in					&& \
  sed < project.pbxproj.in > project.pbxproj				   \
    -e "s/\(HEADER_SEARCH_PATHS[^A-Za-z][^']*'[^']*\)'/\\1 \\\$(inherited)'/"
)
