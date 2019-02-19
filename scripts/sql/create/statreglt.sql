
CREATE TABLE IF NOT EXISTS STATREGLT (
  date                   DATE PRIMARY KEY,
  id_reglement           DECIMAL NOT NULL,
  libelle_reglement      VARCHAR(255) NOT NULL,
  amount                 INT NOT NULL
)
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_unicode_ci
  ENGINE = InnoDB; 
