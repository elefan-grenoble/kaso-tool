source ../../kaso-tool-config.sh

mysql -h localhost -u $dbUser -p $dbPassword < articles.sql
mysql -h localhost -u $dbUser -p $dbPassword < famille.sql
mysql -h localhost -u $dbUser -p $dbPassword < fournisseur.sql
mysql -h localhost -u $dbUser -p $dbPassword < stocks.sql
mysql -h localhost -u $dbUser -p $dbPassword < ventes.sql