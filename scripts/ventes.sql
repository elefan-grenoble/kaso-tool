DROP TABLE IF EXISTS VENTE;

CREATE TABLE VENTE (
  code_article        BIGINT          NOT NULL,
  date                DATE            NOT NULL,
  designation_article VARCHAR(56)     NOT NULL,
  quantite            DECIMAL(40, 30) NOT NULL,
  ca_ht               DECIMAL(10, 3)  NOT NULL,
  ca_ttc              DECIMAL(10, 3)  NOT NULL,
  PRIMARY KEY (code_article, date)
)
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_unicode_ci
  ENGINE = InnoDB;

LOAD DATA LOCAL INFILE '/home/kaso/exports/KASO_VENTE_2017_2018122617044825.CSV'
INTO TABLE VENTE
CHARACTER SET 'latin2'
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(code_article, @date, designation_article, quantite, ca_ht, ca_ttc, @dummy)
SET date = STR_TO_DATE(@date, '%e/%c/%Y');

LOAD DATA LOCAL INFILE '/home/kaso/exports/KASO_VENTE_2018_2018122617044941.CSV'
INTO TABLE VENTE
CHARACTER SET 'latin2'
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(code_article, @date, designation_article, quantite, ca_ht, ca_ttc, @dummy)
SET date = STR_TO_DATE(@date, '%e/%c/%Y');

ALTER TABLE kaso.VENTE ADD CONSTRAINT VENTE_ARTICLE_FK FOREIGN KEY (code_article) REFERENCES kaso.ARTICLE(code);
