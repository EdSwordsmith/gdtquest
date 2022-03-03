#! /bin/sh

cd build
mkdir temp
cp ../main.lua temp/main.lua
cp -r ../code temp/code
cp -r ../libs temp/libs
cp -r ../assets temp/assets

cd temp
zip -9 -r quest.love .
mv quest.love ..
cd ..
rm -rf temp

cp -r love-11.4-win64 game
cat game/love.exe quest.love > game/quest.exe
rm game/love.exe
cd game
zip -9 -r quest.zip .
mv quest.zip ..
cd ..
rm -rf game
