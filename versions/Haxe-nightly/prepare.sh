#!/bin/bash -e

cd "$( dirname "${BASH_SOURCE[0]}" )"
ln -sfn ../../benchmark.sh .
ln -sfn ../../build 
ln -sfn ../../buildAll.hxml .
ln -sfn ../../buildConvertCsv.hxml
ln -sfn ../../data
ln -sfn ../../haxe_libraries/ haxe_libraries
ln -sfn ../../haxelib.json .
ln -sfn ../../results/Haxe-nightly results
ln -sfn ../../src
ln -sfn ../../srcPages
lix download haxe nightly
lix use haxe nightly
lix download
lix install haxelib:hxcpp
