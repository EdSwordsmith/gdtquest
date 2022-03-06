#! /bin/sh

cd build
mkdir temp
cp ../main.lua temp/main.lua
cp ../conf.lua temp/conf.lua
cp -r ../code temp/code
cp -r ../libs temp/libs
cp -r ../assets temp/assets

cd temp
zip -9 -r quest.love .
mv quest.love ..
cd ..
rm -rf temp

# Windows Executable
cp -r love-11.4-win64 quest
cat quest/love.exe quest.love > quest/quest.exe
rm quest/love.exe
rm quest/lovec.exe
zip -9 -r quest.zip quest
rm -rf quest

# MacOS App
cp quest.love quest.app/Contents/Resources/

