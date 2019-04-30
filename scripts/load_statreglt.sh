DIRNAME=`dirname "$0"`
CONFIG_FILE="$DIRNAME/kaso-tool-config.sh"
echo "Config file: $CONFIG_FILE"

source $CONFIG_FILE

## Appeler avant le script tmp_statreglt.sql

echo "Exports directory: $exportsDir"

echo 'Populating the stat jour table'
for f in $exportsDir/KASO_STATREGLT_*.CSV; do
    echo "Load file: $f"
	
    mysql -h localhost -u $dbUser -p$dbPassword $dbName -e"
	LOAD DATA LOCAL INFILE '$f'
	INTO TABLE TMP_STATREGLT
	CHARACTER SET 'utf8'
    FIELDS TERMINATED BY ';'
    IGNORE 1 LINES
    (@date, reglement_id, reglement, montant)
    SET date   = STR_TO_DATE(@date, '%e/%c/%Y')"
    mv $f $loadedDir
done


mysql -h localhost -u $dbUser -p$dbPassword $dbName -e"
SELECT FI_MODESDEPAIEMENT() AS FI_MODESDEPAIEMENT;
SELECT FI_STATREGLEMENT() AS FI_STATREGLEMENT;"
