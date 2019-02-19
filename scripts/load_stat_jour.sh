DIRNAME=`dirname "$0"`
source "$DIRNAME/kaso-tool-config.sh"

function loadDailyStat {
    file_pattern=$1
    table_name=$2
    fields=$3
    echo "Populating the ${table_name} table"
    for f in $exportsDir/$file_pattern*.CSV; do
        echo $f
        mysql -h localhost -u $dbUser -p$dbPassword $dbName -e"
        LOAD DATA LOCAL INFILE '$f'
        INTO TABLE ${table_name}
        CHARACTER SET 'latin2'
        FIELDS TERMINATED BY ';'
        IGNORE 1 LINES
        ${fields}
        SET date   = STR_TO_DATE(@date, '%e/%c/%Y')"
        mv $f $loadedDir
    done
}

loadDailyStat 'KASO_STATJOUR_' 'STATJOUR' '(@date, ca_ht, ca_ttc, nb_clients, @dummy)'
loadDailyStat 'KASO_STATREGLT_' 'STATREGLT' '(@date, id_reglement, libelle_reglement, amount)'
loadDailyStat 'KASO_VENTE_' 'VENTE' '(code_article, @date, designation_article, quantite, ca_ht, ca_ttc)'
