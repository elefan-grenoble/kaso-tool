DROP TABLE IF EXISTS VENTE;

CREATE TABLE VENTE (
  clef_stat           BIGINT          NOT NULL,
  date                DATE            NOT NULL,
  designation_article VARCHAR(56)     NOT NULL,
  quantite            DECIMAL(40, 30) NOT NULL,
  ca_ht               DECIMAL(10, 3)  NOT NULL,
  ca_ttc              DECIMAL(10, 3)  NOT NULL
)
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_unicode_ci
  ENGINE = InnoDB;

LOAD DATA LOCAL INFILE '/home/kaso/exports/KASO_VENTE_2017_2018122617044825.CSV'
INTO TABLE VENTE
CHARACTER SET 'latin2'
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(clef_stat, @date, designation_article, quantite, ca_ht, ca_ttc, @dummy)
SET date = STR_TO_DATE(@date, '%e/%c/%Y');

LOAD DATA LOCAL INFILE '/home/bastien/lelefan/kaso/exports/KASO_VENTE_2018_2018122617044941.CSV'
INTO TABLE VENTE
CHARACTER SET 'latin2'
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(clef_stat, @date, designation_article, quantite, ca_ht, ca_ttc, @dummy)
SET date = STR_TO_DATE(@date, '%e/%c/%Y');