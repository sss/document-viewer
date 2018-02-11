#!/bin/bash

git submodule update --init --recursive --force
git submodule foreach --recursive git clean -dfx

pushd  ./document-viewer/jni/mupdf/mupdf
make generate
popd

pushd  ./document-viewer/jni/djvu/djvulibre
patch -p1 < ../overrides/remove_print_save_api.patch
patch -p1 < ../overrides/compatibility.patch
popd

