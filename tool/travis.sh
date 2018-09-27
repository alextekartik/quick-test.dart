#!/bin/bash

# Fast fail the script on failures.
set -e

pkgtest ()
{
    echo "\$ pkgtest -sgit $*" 1>&2;
    eval "pub run pubtest:pubtestpackage -sgit $* -r expanded"
}

# export pkgtest="pub run pubtest:pubtestpackage -sgit"
# pkgtest git://github.com/tekartik/tekartik_browser_utils.dart -p chrome,firefox test/js_utils_browser_test.dart
# pkgtest git://github.com/tekartik/tekartik_io_utils.dart -p vm
# pkgtest git://github.com/tekartik/tekartik_common_utils.dart -p chrome,firefox,vm test/json_utils_test.dart
# pkgtest git://github.com/tekartik/sembast.dart -p vm test/io_factory_test_.dart --name crud
# pkgtest git://github.com/tekartik/idb_shim.dart -p chrome test/idb_browser_test.dart --name index_cursor
# pkgtest git://github.com/tekartik/tekartik_sc.dart -p vm test/sc_test.dart

dart tool/travis.dart
