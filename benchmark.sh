#!/bin/bash

source benchmark.env

readonly DATA=$*

function resetGit {
    for i in $( ls data ) ; do (cd data/$i; git checkout -- .); done;
}

resetGit
./out/cpp/AllocMain $DATA
resetGit
node out/AllocMain.js $DATA
resetGit
node out/AllocMain.es6.js $DATA
resetGit
java -jar out/java/AllocMain.jar $DATA
resetGit
java -jar out/jvm/AllocMain.jar $DATA
resetGit
hl out/AllocMain.hl $DATA
resetGit
./out/hl/AllocMain $DATA
resetGit
mono out/cs/bin/AllocMain.exe $DATA
resetGit
haxe build/common.hxml --run AllocMain $DATA
resetGit
php out/php/index.php $DATA
resetGit
neko out/AllocMain.n $DATA
resetGit
python3 out/AllocMain.py $DATA
# resetGit
# lua out/formatter.lua $DATA
