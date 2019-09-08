DIRNAME=`dirname "$0"`
source "$DIRNAME/kaso-tool-config.sh"

pushd "$DIRNAME"

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
echo 'Populating the code_catalogue table'
mysql -h localhost -u $dbUser -p$dbPassword $dbName < sql/create/code_catalogue.sql
popd
