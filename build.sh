#!/bin/bash
if [ $* == bulma ]; then
    echo "Compile sass..."
    sass src/style/sass/bulma_config.scss:src/style/bulma.css
    echo "Done"
elif [ $* == elm ]; then
    echo "Compile elm..."
    elm make src/Main.elm --output elm.js
    echo "Build elm"
else
    echo "Compile sass & elm..."
    sass src/style/sass/bulma_config.scss:src/style/bulma.css
    elm make src/Main.elm --output elm.js
    echo "Build sass & elm"
fi
echo "Done"
