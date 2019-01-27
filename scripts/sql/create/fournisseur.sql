DROP TABLE IF EXISTS FOURNISSEUR;

CREATE TABLE FOURNISSEUR (
  code                   INT PRIMARY KEY,
  nom                    VARCHAR(128) NOT NULL,
  addresse1              VARCHAR(128),
  addresse2              VARCHAR(128),
  ville                  VARCHAR(128),
  code_postal            VARCHAR(64),
  mt_franco              VARCHAR(64),
  tva_intercommunautaire VARCHAR(64),
  delai                  VARCHAR(64),
  remise                 VARCHAR(64),
  nom_contact            VARCHAR(64),
  telephone              VARCHAR(64),
  portable               VARCHAR(64),
  fax                    VARCHAR(64),
  email                  VARCHAR(64),
  site_internet          VARCHAR(64)
)
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_unicode_ci
  ENGINE = InnoDB;

LOAD DATA LOCAL INFILE '/home/kaso/exports/KASO_FOURNISSEUR.CSV'
INTO TABLE FOURNISSEUR
CHARACTER SET 'latin2'
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(code, nom, addresse1, addresse2, ville, code_postal, mt_franco, tva_intercommunautaire, delai, remise, nom_contact, telephone, portable, fax, email, site_internet, @dummy);