#!/bin/bash

flutter build web --release
#rm -fr $HOME/ndwdir/webtest/*
cd $HOME/ndwdir/webtest/
shopt -s extglob dotglob && rm -fr !\(public\)
cd -

cp -r ./build/web/* $HOME/ndwdir/webtest