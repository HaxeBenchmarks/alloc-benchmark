#!/bin/bash

source benchmark.env

readonly DATA=$*

./out/cpp/AllocMain $DATA
./out/cppGCGen/AllocMain $DATA
haxelib run hxcpp out/AllocMain.cppia 
node out/AllocMain.js $DATA
node out/AllocMain.es6.js $DATA
java -jar out/java/AllocMain.jar $DATA
java -jar out/jvm/AllocMain.jar $DATA
hl out/AllocMain.hl $DATA
./out/hl/AllocMain $DATA
mono out/cs/bin/AllocMain.exe $DATA
haxe build/common.hxml --run AllocMain $DATA
php out/php/index.php $DATA
neko out/AllocMain.n $DATA
python3 out/AllocMain.py $DATA
lua out/AllocMain.py $DATA

# lua out/formatter.lua $DATA

# second run to smooth graphs a little
./out/cpp/AllocMain $DATA
./out/cppGCGen/AllocMain $DATA
node out/AllocMain.js $DATA
node out/AllocMain.es6.js $DATA
java -jar out/java/AllocMain.jar $DATA
java -jar out/jvm/AllocMain.jar $DATA
hl out/AllocMain.hl $DATA
./out/hl/AllocMain $DATA
mono out/cs/bin/AllocMain.exe $DATA
haxe build/common.hxml --run AllocMain $DATA
