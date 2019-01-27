source ../../kaso-tool-config.sh

echo 'Populating the stat jour table'
for f in $exportsDir/KASO_STATJOUR_*.CSV; do
    echo $f
    mysql -h localhost -u $dbUser -p$dbPassword $dbName -e"
    LOAD DATA LOCAL INFILE '$f'
    INTO TABLE STATJOUR
    CHARACTER SET 'latin2'
    FIELDS TERMINATED BY ';'
    IGNORE 1 LINES
    (@date, ca_ht, ca_ttc, nb_clients, @dummy)
    SET date   = STR_TO_DATE(@date, '%e/%c/%Y')"
    mv $f $loadedDir
done



