source ../../kaso-tool-config.sh

echo 'Recreating the database...'
# mysql -h localhost -u $dbUser -p$dbPassword -e "DROP DATABASE ${dbName}; CREATE DATABASE IF NOT EXISTS ${dbName}"
echo 'Populating the fournisseur table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/fournisseur.sql
echo 'Populating the famille table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/famille.sql
echo 'Populating the rayon table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/rayon.sql
echo 'Populating the emplacement table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/emplacement.sql
echo 'Populating the marque table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/marque.sql
echo 'Populating the provenance table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/provenance.sql
echo 'Populating the articles table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/articles.sql
echo 'Populating the stocks table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/stocks.sql
echo 'Populating the ventes table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/ventes.sql
echo 'Populating the stat jour table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/statjour.sql
echo 'Populating the stat reglement table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/statreglt.sql
