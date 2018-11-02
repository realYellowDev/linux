#!/bin/bash

# Einfaches Backup-Script

SIKFILEPRE=${HOME}/sicherung

SIKFILENAME=${SIKFILEPRE}_`date +%Y%m%d`.tar

if [ $# -lt 1 ]; then

    echo "Fehler: Kein Dateiname eingegeben"

    echo "Benutzung: $0 datei.ext [datei2.ext] [datei.ext]"

    exit 1

else

    echo ${SIKFILENAME} wird erzeugt

    tar -cvf ${SIKFILENAME} "$@"

    if [ $? -eq 0 ]

    then

        echo Dateien erfolgreich gesichert

    else

        echo Fehler bei Datensicherung

        exit 2

    fi

    gzip $SIKFILENAME

fi
