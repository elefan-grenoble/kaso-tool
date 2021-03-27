DIRNAME=`dirname "$0"`
source "$DIRNAME/kaso-tool-config.sh"

echo 'Clear supplying database'
mysql -h localhost -u $dbUser -p$dbPassword $dbName -e \
    "DELETE FROM SUPPLYING;"
