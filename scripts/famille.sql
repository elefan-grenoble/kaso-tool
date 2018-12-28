DROP TABLE IF EXISTS FAMILLE;

CREATE TABLE FAMILLE (
  code                INT NOT NULL,
  code_s_famille      INT NOT NULL,
  code_ss_famille     INT NOT NULL,
  nom                 VARCHAR(512) NOT NULL,
  PRIMARY KEY (code, code_s_famille, code_ss_famille)
)
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_unicode_ci
  ENGINE = InnoDB;

LOAD DATA LOCAL INFILE '/home/kaso/exports/KASO_FAMILLE.CSV'
INTO TABLE FAMILLE
CHARACTER SET 'latin2'
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(code, code_s_famille, code_ss_famille, nom, @dummy);