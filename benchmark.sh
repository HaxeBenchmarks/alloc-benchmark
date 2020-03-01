#!/bin/bash

source benchmark.env

readonly DATA=$*

./out/cpp/AllocMain $DATA
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
# resetGit
# lua out/formatter.lua $DATA
