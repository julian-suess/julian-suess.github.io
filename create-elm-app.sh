#!/bin/bash

## Init project from elm
elm init <<EOF
Y
EOF

## Add a html file with linked elm.js & stylesheet.css
echo '<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Create Elm App</title>
    <meta name="author" content="name" />
    <meta name="description" content="description here" />
    <meta name="keywords" content="keywords,here" />
    <link
      rel="shortcut icon"
      href="favicon.ico"
      type="image/vnd.microsoft.icon"
    />
    <link rel="stylesheet" href="src/style/bulma.css" type="text/css" />
    <link rel="stylesheet" href="src/style/style.css" type="text/css" />
    <script src="elm.js"></script>
  </head>
  <body>
    <div id="elm-node"></div>
    <script>
      Elm.Main.init({
        node: document.getElementById("elm-node")
      });
    </script>
  </body>
</html>' >index.html

# Add build script for elm
echo '#!/bin/bash
echo "Compile elm..."
elm make src/Main.elm --output elm.js
echo "Done"' >build.sh

# Add watch script for elm
echo '#!/bin/bash
echo "Watching elm..."
fswatch -o ./src/Main.elm | xargs -n1 -I{} sh ./build.sh' >watch.sh

if [ $* == bulma ]; then
    echo Installing bulma...
    echo '#!/bin/bash
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
echo "Done"'>build.sh
    echo '#!/bin/bash
if [ $* == sass ]; then
    echo "Watching sass..."
    fswatch -o ./src/style/sass/* | xargs -n1 -I{} sh ./build.sh bulma
elif [ $* == elm ]; then
    echo "Watching elm..."
    fswatch -o ./src/Main.elm | xargs -n1 -I{} sh ./build.sh elm
else
    echo "Do you wanna watch elm or sass?"
fi
echo "Done"'>watch.sh
    cd src
    mkdir style
    cd style
    curl -O "https://registry.npmjs.org/bulma/-/bulma-0.8.0.tgz"
    tar zxvf bulma-0.8.0.tgz
    mv package bulma-0.8.0
    rm bulma-0.8.0.tgz
    echo '' >style.css
    mkdir sass
    cd sass
    echo '@charset "utf-8";
@import "../bulma-0.8.0/bulma.sass";' >bulma_config.scss
    cd ..
    cd ..
    echo Added bulma

    else
    # Creat stylesheet
    cd src
    mkdir style
    cd style
    echo '' >style.css
    cd ..
    echo Added empty stylesheet
fi

# Create Main.elm
echo 'module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = Int


init : Model
init =
  0



-- UPDATE


type Msg
  = Increment
  | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]' >Main.elm

cd ..

echo '# elm-package generated files
elm-stuff
# elm-repl generated files
repl-temp-*
elm.js'>.gitignore

chmod 755 ./build.sh
./build.sh

# We are done
echo "Done"
