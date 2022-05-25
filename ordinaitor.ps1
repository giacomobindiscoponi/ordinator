param([switch]$whatif, [switch]$move)
if($args[0] -eq ""){
    write-host "inserire parametri"
}else{
    if($whatif){
        write-host "tutti i file che hanno una di queste estensioni:"
        for($i = 0; $i -lt $args.length ; $i++){
            write-host $args[$i]
        }
        write-host "ovvero le estensioni che sono state scelte tramite parametro"  
        write-host "verranno spostati se utiliziamo l'estensione -move o copiati e zippati se usimo "
        write-host "l'estensione -backUp in una cartella che finisce con la propria estensione"
    }else{
        if( -not (Test-Path ".\root")){
            #creazione cartella root
            mkdir ".\root"

            #logs
            $giorno = Get-Date -Format dd.MM.yy
            $ora = Get-Date -format hh:mm:ss
            Add-Content .\logs.log "$giorno - $ora creata cartella root"
        }else{
            #logs
            $giorno = Get-Date -Format dd.MM.yy
            $ora = Get-Date -format hh:mm:ss
            Add-Content .\logs.log "$giorno - $ora cartella root non creata perch� esiste gi�"
        }
        $root = Get-Location

        #creazione delle cartelle con le estensione dei file
        for($i = 0; $i -lt $args.length; $i++){
            $percorso = "root" + "\" + $args[$i];
            if( -not (Test-Path $percorso)){
                #creazione cartelle
                
                mkdir $percorso

                #logs
                $giorno = Get-Date -Format dd.MM.yy
                $ora = Get-Date -format hh:mm:ss
                Add-Content .\logs.log "$giorno - $ora creata cartella $percorso"
            }else{
                $giorno = Get-Date -Format dd.MM.yy
                $ora = Get-Date -format hh:mm:ss
                Add-Content .\logs.log "$giorno - $ora la cartella root esiste già"
            }
        }
        #lo script viene eseguito dalla cartella dove ci troviamo al momento
        ForEach($element in Get-ChildItem -r){
            $controllo = "true";
            if($element.PSIsContainer){
                #logs
                Add-Content .\logs.log "$giorno - $ora ignorata cartella $element"  
            }else{
                #aggiunta file alla cartella
                for($i = 0; $i -lt $args.length ; $i++){
                    $pathEstensione = ((Split-Path $element -Leaf).Split('.'));
                    if($pathEstensione -eq $args[$i]){
                        $argomentoAttuale = $args[$i];
                        $destinazione = "$root" + "\root" + "\" + $argomentoAttuale + "\$element";
                        if( -not (Test-Path $destinazione)){
                            #copia dei file nelle cartelle
                            if($move){
                                Move-Item $element.FullName -Destination $destinazione;
                            }else{
                                Copy-Item $element.FullName -Destination $destinazione;
                            }
            
                            #logs
                            $giorno = Get-Date -Format dd.MM.yy
                            $ora = Get-Date -format hh:mm:ss
                            Add-Content .\logs.log "$giorno - $ora aggiunto file $element alla cartella $destinazione";
                            $controllo = "false";
                        }else{
                            #logs
                            $giorno = Get-Date -Format dd.MM.yy
                            $ora = Get-Date -format hh:mm:ss
                            Add-Content .\logs.log "$giorno - $ora nella cartella e già presente un file con lo stesso nome"
                        }
                    }
                }
                if($controllo -eq "true"){
                    #se file viene ignorato
                    $giorno = Get-Date -Format dd.MM.yy
                    $ora = Get-Date -format hh:mm:ss
                    Add-Content .\logs.log "$giorno - $ora file $element ignorato";
                }
            }
        }
        if(-not($move)){
            if( -not (Test-Path ".\backup.zip")){
                Compress-Archive -Path ".\root" -destinationPath ".\backup"
            }else{
                #logs
                $giorno = Get-Date -Format dd.MM.yy
                $ora = Get-Date -format hh:mm:ss
                Add-Content .\logs.log "$giorno - $ora cartela non zippabile dato che i file esoste già un file .\backup"
            }
        }
    }
}