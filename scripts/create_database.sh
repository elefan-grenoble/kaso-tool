source ../../kaso-tool-config.sh

echo 'Recreating the database...'
mysql -h localhost -u $dbUser -p$dbPassword -e "CREATE DATABASE IF NOT EXISTS ${dbName}"
#echo 'Populating the fournisseur table'
#mysql -h localhost -u $dbUser -p$dbPassword $dbName < fournisseur.sql
#echo 'Populating the famille table'
#mysql -h localhost -u $dbUser -p$dbPassword $dbName < famille.sql
#echo 'Populating the articles table'
#mysql -h localhost -u $dbUser -p$dbPassword $dbName < articles.sql
#echo 'Populating the stocks table'
#mysql -h localhost -u $dbUser -p$dbPassword $dbName < stocks.sql
#echo 'Populating the ventes table'
#mysql -h localhost -u $dbUser -p$dbPassword $dbName < ventes.sql
echo 'Populating the stat jour table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/statjour.sql
