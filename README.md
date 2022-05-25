# ordinator
## funzionamento
---
lo script serve per riodinare i file o semplicemente<br>
fare una zip dei file desiderati.

la sintassi è questa:
```
.\scriptFinale [<estensioni>][<estensioni> -move]
```

### default
usando il parametro __-backUp__ verrà creata una cartella di nome root,<br>
dopo di che, per ogni estensione che abbaimo inserito come parametro, verrà creata<br>
una sotto cartella in root con lo stesso nome. Poi tutti i file che si trovano nella<br>
stessa posizione dello script o in una sotto cartella sempre a partire della posizione dello<br>
script verrà _copiato_ nella sotto cartella di root che <br>
corrisponde alla propria estensione e in fine la cartela root verrà zippata.

### __-move__
usando il parametro __-move__ verrà creata una cartella di nome root,<br>
dopo di che, per ogni estensione che abbaimo inserito come parametro, verrà creata<br>
una sotto cartella in root con lo stesso nome. Poi tutti i file che si trovano nella<br>
stessa posizione dello script o in una sotto cartella sempre a partire della posizione dello<br>
script verrà _spostato_ nella sotto cartella di root che corrisponde alla propria estensione.


## esempi
---
```
.\scriptFinale docs html -move
```

```
.\scriptFinale docs html
```
