DROP TABLE IF EXISTS STOCKS;

CREATE TABLE STOCKS (
  code         BIGINT PRIMARY KEY,
  qte_stocks   INT      NOT NULL,
  qte_commande INT      NOT NULL,
  date         DATETIME NOT NULL
)
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_unicode_ci
  ENGINE = InnoDB;

LOAD DATA LOCAL INFILE '/home/kaso/exports/KASO_STOCKS.CSV'
INTO TABLE STOCKS
CHARACTER SET 'latin2'
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(code, qte_stocks, qte_commande, @date, @heure, @dummy)
SET date = STR_TO_DATE(CONCAT(@date, @heure),'%e/%c/%Y %Hh%i');

ALTER TABLE kaso.STOCKS ADD CONSTRAINT STOCKS_ARTICLE_FK FOREIGN KEY (code) REFERENCES kaso.ARTICLE(code);