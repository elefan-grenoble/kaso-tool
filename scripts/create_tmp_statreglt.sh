DIRNAME=`dirname "$0"`
CONFIG_FILE="$DIRNAME/kaso-tool-config.sh"
echo "Config file: $CONFIG_FILE"

source $CONFIG_FILE

## creation de tmp_statreglt.sql

echo 'Creating the stat jour table'

mysql -h localhost -u $dbUser -p$dbPassword $dbName -e"
DROP TABLE IF EXISTS TMP_STATREGLT;

CREATE TABLE IF NOT EXISTS TMP_STATREGLT (
  date date NOT NULL,
  reglement_id int(11) NOT NULL,
  reglement varchar(32) NOT NULL,
  montant float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
"