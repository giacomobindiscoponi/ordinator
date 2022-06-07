# ordinator
## Funzionamento
---
lo script serve per riodinare i file per estensione o semplicemente<br>
fare una zip dei file desiderati.

la sintassi è questa:
```
.\ordintor [<estensioni>][<estensioni> -move]
```

### __Default__
inserendo soltanto delle estensioni verrà creata una cartella di nome root,<br>
dopo di che, per ogni estensione che abbaimo inserito come parametro, verrà creata<br>
una sotto cartella in root con lo stesso nome. Poi tutti i file che si trovano nella<br>
stessa posizione dello script o in una sotto cartella sempre a partire della posizione dello<br>
script verrà _copiato_ nella sotto cartella di root che <br>
corrisponde alla propria estensione e in fine la cartella root verrà zippata.

### __-move__
usando il parametro __-move__ verrà creata una cartella di nome root,<br>
dopo di che, per ogni estensione che abbaimo inserito come parametro, verrà creata<br>
una sotto cartella in root con lo stesso nome. Poi tutti i file che si trovano nella<br>
stessa posizione dello script o in una sotto cartella sempre a partire della posizione dello<br>
script verrà _spostato_ nella sotto cartella di root che corrisponde alla propria estensione.

in qualsiasi caso nella cartella root verrà creato un file di log<br>
dove verranno scritte tutte le operazioni eseguite

## Esempi
---
```
.\scriptFinale flp wav -move
```
[prima](img/prima.PNG)<br>
[comando](img/comandoMove.PNG)<br>
[dopo](img/dopoMove.PNG)<br>
[nella root](img/nellaRoot.PNG)<br>

```
.\scriptFinale flp wav
```
[prima](img/prima.PNG)<br>
[comando](img/comandoBackUp.PNG)<br>
[dopo](img/dopoBackUp.PNG)<br>
[nella root](img/nellaRoot.PNG)<br>
