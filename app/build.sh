#!/bin/bash

cd ..
for x in *
do
        if [ "$x" != "app" ]
        then
                rm -r $x;
        fi
done;

cd app

cp -R build/. ../