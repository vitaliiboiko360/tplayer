#!/bin/bash

flutter build web --release
rm -fr $HOME/ndwdir/webtest/*
cp -r ./build/web/* $HOME/ndwdir/webtest