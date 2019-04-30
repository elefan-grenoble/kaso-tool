DIRNAME=`dirname "$0"`
CONFIG_FILE="$DIRNAME/kaso-tool-config.sh"
echo "Config file: $CONFIG_FILE"

source $CONFIG_FILE

## creation de tmp_statreglt.sql

echo 'Creating the stat jour table'

mysql -h localhost -u $dbUser -p$dbPassword $dbName -e"
DROP TABLE IF EXISTS MODESDEPAIEMENT;

CREATE TABLE IF NOT EXISTS MODESDEPAIEMENT (
  id tinyint(3) unsigned NOT NULL,
  nom varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `MODESDEPAIEMENT`
 ADD PRIMARY KEY (`id`);
 
DROP TABLE IF EXISTS STATREGLEMENT;

CREATE TABLE IF NOT EXISTS STATREGLEMENT (
  date date NOT NULL,
  reglement_id tinyint(3) unsigned NOT NULL,
  montant float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `STATREGLEMENT`
 ADD PRIMARY KEY (`date`,`reglement_id`);

DELIMITER $$

CREATE DEFINER=`root`@`%` FUNCTION `FI_MODESDEPAIEMENT`() RETURNS int(11)
BEGIN

	DECLARE rs int;
    
	INSERT INTO MODESDEPAIEMENT(id, nom)
	SELECT t.reglement_id, t.reglement
	FROM TMP_STATREGLT AS t
	LEFT OUTER JOIN MODESDEPAIEMENT AS p
		ON t.reglement_id = p.id
    WHERE isnull(p.nom)
	GROUP BY t.reglement_id;
    
    SELECT ROW_COUNT() INTO rs;
    
	RETURN rs;
	
END$$


CREATE DEFINER=`root`@`%` FUNCTION `FI_MODESDEPAIEMENT`() RETURNS int(11)
BEGIN

	DECLARE rs int;
    
	INSERT INTO MODESDEPAIEMENT(id, nom)
	SELECT t.reglement_id, t.reglement
	FROM TMP_STATREGLT AS t
	LEFT OUTER JOIN MODESDEPAIEMENT AS p
		ON t.reglement_id = p.id
    WHERE isnull(p.nom)
	GROUP BY t.reglement_id;
    
    SELECT ROW_COUNT() INTO rs;
    
	RETURN rs;
	
END$$

DELIMITER ;
"