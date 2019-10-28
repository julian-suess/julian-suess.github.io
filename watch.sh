#!/bin/bash
if [ $* == sass ]; then
    echo "Watching sass..."
    fswatch -o ./src/style/sass/* | xargs -n1 -I{} sh ./build.sh bulma
elif [ $* == elm ]; then
    echo "Watching elm..."
    fswatch -o ./src/Main.elm | xargs -n1 -I{} sh ./build.sh elm
else
    echo "Do you wanna watch elm or sass?"
fi
echo "Done"
