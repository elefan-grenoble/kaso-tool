
CREATE TABLE IF NOT EXISTS STATREGLT (
  date                   DATE,
  id_reglement           DECIMAL NOT NULL,
  libelle_reglement      VARCHAR(255) NOT NULL,
  amount                 INT NOT NULL,
  PRIMARY KEY (date, id_reglement)
)
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_unicode_ci
  ENGINE = InnoDB; 
