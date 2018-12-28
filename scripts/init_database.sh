source ../../kaso-tool-config.sh

mysql -h localhost -u $dbUser -p $dbPassword $dbName < articles.sql
mysql -h localhost -u $dbUser -p $dbPassword $dbName < famille.sql
mysql -h localhost -u $dbUser -p $dbPassword $dbName < fournisseur.sql
mysql -h localhost -u $dbUser -p $dbPassword $dbName < stocks.sql
mysql -h localhost -u $dbUser -p $dbPassword $dbName < ventes.sql