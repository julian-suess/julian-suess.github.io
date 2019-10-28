# Readme

Dies ist eine kleines Projekt, um die Entwicklung von statischen Seiten mit [Elm](https://elm-lang.org) auszuprobieren.

## Struktur

Für die laufende Anwendung wichtig sind im root-dir nur `index.html` und `elm.js`. Im `src/style` Verzeichnis finden wir noch die beiden css-Dateien, die in der `index.html` eingebunden sind.

In der Entwicklung passiert die Magie in der `src/Main.elm` und für das Styling in der `style/sass/bulma_config.scss` und `style/style.css`. Weitere css oder scss Dateien können hinzugefügt werden, müssen dann aber in der `index.html` verlinkt werden.

## Build

Das Projekt kann mit dem Befehl `bash build.sh` gebaut werden.  
`bash build.sh elm` baut nur elm und `bash build.sh bulma` nur bulma (also das css vom scss).

## Watch

Mittels `bash watch.sh elm` wird das src-Verzeichnis überwacht und bei Veränderungen neu gebaut.
`bash watch.sh sass` überwacht alle Dateien im Verzeichnis `src/style/sass`.

## Run

Einfach die `index.html` von einem lokalen Server laufen lassen, z.B. mit `serve`.

# create-elm-app

Ein kleines Skript, das einem das Elm-Leben erleichtern soll.

```
bash create-elm-app.sh
```

Legt ein elm-Projekt an und fügt eine `index.html`, sowie ein stylesheet und eine [Beispiel](https://elm-lang.org/examples/buttons) `Main.elm` an.
Außedem legt es ein `build.sh` und `watch.sh` an.

```
bash create-elm-app.sh bulma
```

Fügt zusätzlich noch [Bulma](https://bulma.io) hinzu.
